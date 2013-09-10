import sys

from TOSSIM import *
from fingerIIRequestMsg import *

from SimpleXMLRPCServer import SimpleXMLRPCServer
from SimpleXMLRPCServer import SimpleXMLRPCRequestHandler
from SocketServer import ThreadingMixIn
import xmlrpclib

LOAD_POLICY = 0
REMOVE_POLICY = 1
ENABLE_POLICY = 2
DISABLE_POLICY = 3
GET_POLICY = 4  # not in use
TRIGGER_EVENT = 5

#Clear the existing system log on startup.
open('log.txt', 'w').close()

#################
#################
class RequestHandler(SimpleXMLRPCRequestHandler):
    rpc_paths = ('/RPC2',)
#################
#################

class AugSimpleXMLRPC(SimpleXMLRPCServer):
    def serve_forever(self):
        self.quit = 0
        while not self.quit:
            self.handle_request()
            
class CommandProxy:
    TOPOLOGY_FILE = "topo.txt"
    NOISE_FILE = "meyer-heavy.txt"
    LOG_FILE = "./log.txt"
      
    def read_log(self):
            handle = open(self.LOG_FILE, "r")
            return xmlrpclib.Binary(handle.read())
###################################################################### 
#Used to advance the simulation.     
    def advance_simulation(self, advance_time, advance_events):
        curTime = self.tossim.time()
        self.output.write("Advancing simulation for " + str(advance_time) + " ticks.\n")
        while (curTime + advance_time > self.tossim.time()):
            self.runNextEvent()
            
        self.output.write("Running " + str(advance_events) + " additional events. (time independent)\n")
        for i in range(advance_events):
            self.tossim.runNextEvent()
            
        return 1
###################################################################### 
#Used to invoke a single event, private method. 
    def runNextEvent(self):
        self.output.write("Executing event at time " + str(self.tossim.time()) + "\n")
        self.tossim.runNextEvent()
###################################################################### 
#Used for setting up the topology, private method.  
    def setupTopology(self):
        with open(self.TOPOLOGY_FILE, "r") as topology:
            for line in topology:
                s = line.split()
                if s:
                    self.radio.add(int(s[0]), int(s[1]), float(s[2]))
            self.output.write("Topology file contents read. Closing.\n")
###################################################################### 
#Used for setting up the noise model, private method.
    def setupNoiseModel(self):
        with open(self.NOISE_FILE, "r") as noise:
            for line in noise:
                str1 = line.strip()
                if str1:
                    val = int(str1)
                    for i in range(1, self.num_nodes):
                        self.tossim.getNode(i).addNoiseTraceReading(val)
            for i in range(0, self.num_nodes):
                self.output.write("Creating noise model for node " + str(i) + ".\n")
                self.tossim.getNode(i).createNoiseModel()
            self.output.write( "Noise model file contents read. Closing.\n")
###################################################################### 
#Used for booting the sensor nodes, private method.  
    def setupBoot(self):
        for i in range(0, self.num_nodes):
            bootTime = 100001 * i
            self.tossim.getNode(i).bootAtTime(bootTime)
            self.output.write("Node " + str(i) + " boot time: " + str(bootTime) + ".\n")
        self.output.write("All nodes booted.\n")
            
        settle_time = self.tossim.time() + 100001 * self.num_nodes
        self.output.write("Running events until " + str(settle_time) + " ticks to stabilize simulation.\n")
            
        while (settle_time > self.tossim.time()):
            self.tossim.runNextEvent()
            
        self.output.write("Simulation stable at time: " + str(self.tossim.time()) + ".\n")                
######################################################################
#Used for initiating TOSServ.
    def initialize(self, n_nodes):
        if (n_nodes <= 0):
            return 0
        self.num_nodes = n_nodes
        
        #Clear and instantiate the TOSSIM instance.
        self.tossim = None
        self.tossim = Tossim([])
        self.mac = self.tossim.mac()
        self.radio = self.tossim.radio()
        
        #Clear and open log for writing.
        self.output = open(self.LOG_FILE, "w").close()
        self.output = open(self.LOG_FILE, "w")
        self.output.write("Log socket/file open.\n")
        
        #Route output from the core module to the output log
        #TODO Route this to the TCP socket instance.
        self.tossim.addChannel("core", self.output)
        self.output.write("TOSSIM output rerouted to socket/file.\n")
        
        #Initiate the WSN topology
        self.setupTopology()
        self.output.write("Topology setup complete.\n")
        self.setupNoiseModel()
        self.output.write("Noise model established.\n")
        self.setupBoot()
        self.output.write("Sensor node boot process complete.\n")
        
        #Instantiate a FingerII Request Message object,
        #so we can interact with Finger
        self.fingerMsg = None
        self.fingerMsg = fingerIIRequestMsg()
        self.output.write("FingerII Policy Request Message framework ready.\n")
        return 1
######################################################################
#Used for injecting a new packet.
    def newPacket(self, pkt_data, pkt_type, destination, deliver_time):
        packet = self.tossim.newPacket()
        packet.setData(pkt_data)
        packet.setType(pkt_type)
        packet.setDestination(destination)
        if deliver_time == 0:
            packet.deliverNow(destination)
        else:
            packet.deliver(destination, deliver_time)
            
        self.output.write("Delivering packet " + str(pkt_data) +" to node " + str(destination)+" at time " + str(deliver_time) + ".\n")
        
        return 1
######################################################################
#Used for loading a policy.
    def load_policy(self, data):
        self.fingerMsg.set_source(data[1]);
        self.fingerMsg.set_target(data[2]);
        self.fingerMsg.set_request(LOAD_POLICY);
        self.fingerMsg.set_context_policyId(data[3]);
        self.fingerMsg.set_context_oblPolicy_predicateId(data[4]);
        self.fingerMsg.set_context_oblPolicy_eventId(data[5]);
        self.fingerMsg.set_context_oblPolicy_actionId(data[6]) ;
        self.fingerMsg.set_context_oblPolicy_preArgDesc(data[7]);
        self.fingerMsg.set_context_oblPolicy_actArgDesc(data[8]);
        self.fingerMsg.set_context_oblPolicy_predicateArgs([data[9],data[10],data[11]]);
        self.fingerMsg.set_context_oblPolicy_actionArgs([data[12],data[13],data[14],data[15]]);
        #Deliver the policy packet.
        pkttime = self.tossim.time() + 4000444
        self.newPacket(self.fingerMsg.data, data[0], data[2], pkttime)
        self.advance_simulation(1000, 10)
        
        return 1
######################################################################
#Used for removing a policy.
    def remove_policy(self, data):
        self.fingerMsg.set_source(data[1]);
        self.fingerMsg.set_target(data[2]);
        self.fingerMsg.set_request(REMOVE_POLICY);
        self.fingerMsg.set_context_policyId(data[3]);
        #Deliver the policy packet.
        pkttime = self.tossim.time() + 4000444
        self.newPacket(self.fingerMsg.data, data[0], data[2], pkttime)
        self.advance_simulation(1000, 10);

        return 1
######################################################################
#Used for enabling a policy.
    def enable_policy(self, data):
        self.fingerMsg.set_source(data[1]);
        self.fingerMsg.set_target(data[2]);
        self.fingerMsg.set_request(ENABLE_POLICY);
        self.fingerMsg.set_context_policyId(data[3]);
        #Deliver the policy packet.
        pkttime = self.tossim.time() + 4000444
        self.newPacket(self.fingerMsg.data, data[0], data[2], pkttime)
        self.advance_simulation(1000, 10);
        
        return 1
######################################################################
#Used for disabling a policy.
    def disable_policy(self, data):
        self.fingerMsg.set_source(data[1]);
        self.fingerMsg.set_target(data[2]);
        self.fingerMsg.set_request(DISABLE_POLICY);
        self.fingerMsg.set_context_policyId(data[3]);
        #Deliver the policy packet.
        pkttime = self.tossim.time() + 4000444
        self.newPacket(self.fingerMsg.data, data[0], data[2], pkttime)
        self.advance_simulation(1000, 10);
        
        return 1
######################################################################
#Used for triggering a policy event.
    def event_policy(self, data):
        self.fingerMsg.set_source(data[1]);
        self.fingerMsg.set_target(data[2]);
        self.fingerMsg.set_request(TRIGGER_EVENT);
        self.fingerMsg.set_context_policyId(data[3]);
        #Deliver the policy packet.
        pkttime = self.tossim.time() + 4000444
        self.newPacket(self.fingerMsg.data, data[0], data[2], pkttime)
        self.advance_simulation(1000, 10);
        
        return 1
#################
#################

def kill():
    server.quit = 1
    print "Shutting down."
    return 1
    
HOST, PORT = ("localhost", 8000)
#Main:
#Instantiate the XML RPC server.
server = AugSimpleXMLRPC((HOST, PORT,),
                    requestHandler = RequestHandler,
                    allow_none = True)

#Register the introspection functions (debugging only).
server.register_introspection_functions()
#Register the shutdown function.
server.register_function(kill)
#Register the functions supported by the Command Proxy.
server.register_instance(CommandProxy())
#Initialize the RPC server.
print "TOSSIM Server online."
print "Host: " + str(HOST)
print "Port: " + str(PORT)
server.serve_forever()



