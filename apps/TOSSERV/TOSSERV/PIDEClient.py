import sys
import socket
import xmlrpclib
import atexit
#Set up pygtk and glade for the GUI.
try:  
    import pygtk  
    pygtk.require("2.0")  
except:  
    pass  
try:  
    import gtk.glade
except:  
    print("GTK Not Available")
    sys.exit(1)

##################################################################  
#Used to validate whether a variable is of integer type.
def representsInt(s):
    try: 
        int(s)
        return True
    except ValueError:
        return False
##################################################################  
#Used to display a pop-up error message.
def error(msg):
    dialog = gtk.MessageDialog( 
     parent = None, 
     flags = gtk.DIALOG_DESTROY_WITH_PARENT, 
     type = gtk.MESSAGE_INFO, 
     buttons = gtk.BUTTONS_OK, 
     message_format = str(msg)) 
    dialog.set_title('Error!') 
    dialog.connect('response', lambda dialog, response: dialog.destroy()) 
    dialog.show()
#################
#################
class FingerII_GUI:
    def killServer(self):
        print "Shutting down TOSServ."
        try:
            if (self.proxy.kill()):
                print "TOSServ shut down successfully."
        except socket.error:
            print "TOSServ is already shut down or is not responding."
##################################################################  
#Constructor which initializes the GUI.                                                    
    def __init__(self):
        import atexit
        atexit.register(self.killServer)
        #Initiate a server proxy instance.
        self.proxy = xmlrpclib.ServerProxy('http://localhost:8000')
        
        #Set the Glade file
        self.gladefile = "Finger_GUI.glade" 
         
        self.wTree = gtk.glade.XML(self.gladefile) 
        
        #Create our dictionary and connect it
        dic = { "on_sem_ok_clicked" : self.sem_ok_clicked,
            "on_sem_close_clicked" : self.quit_app,
            "on_loa_close_clicked" : self.quit_app,
            "on_rem_close_clicked" : self.quit_app,
            "on_ena_close_clicked" : self.quit_app,
            "on_dis_close_clicked" : self.quit_app,
            "on_eve_close_clicked" : self.quit_app,
            "on_loa_ok_clicked" : self.loa_ok_clicked,
            "on_rem_ok_clicked" : self.rem_ok_clicked,
            "on_ena_ok_clicked" : self.ena_ok_clicked,
            "on_dis_ok_clicked" : self.dis_ok_clicked,
            "on_eve_ok_clicked" : self.eve_ok_clicked,
            "on_loa_mt_changed" : self.entry_changed,
            "on_loa_pred_changed" : self.loa_pred_changed,
            "on_loa_actionid_changed" : self.loa_pred_changed,
            "on_loa_eventid_changed" : self.loa_pred_changed,
            "on_notebook1_switch_page": self.check_page,
            "destroy" : self.quit_app }
        self.wTree.signal_autoconnect(dic)
        
        #Get the Main Window, and connect the "destroy" event
        self.window = self.wTree.get_widget("window1")
        if (self.window):
            self.window.connect("destroy", gtk.main_quit)  
            self.window.show_all ()      
            self.wTree.get_widget("hbox18").hide()
            self.wTree.get_widget("hbox19").hide()
            self.wTree.get_widget("hbox20").hide()
            self.wTree.get_widget("hbox21").hide()
            self.wTree.get_widget("hbox22").hide()
            self.wTree.get_widget("hbox23").hide()
        self.sim_started = False
##################################################################  
#Used to validate whether the bounds of the arrow control have been exceeded..
    def value_check (self, wname, value, minval, maxval, error_box_name, error_messag_name):
        try: 
            x = int(value)
            if (x in range (minval,maxval)):
                self.wTree.get_widget(error_box_name).hide()
                return True
            else:
                self.wTree.get_widget(error_messag_name).set_text("("+value+") is not a valid number. Please enter number between "+str(minval)+" and max "+str(maxval))
                self.wTree.get_widget(error_box_name).show_now()  
                return False
        except:         
            self.wTree.get_widget(error_messag_name).set_text("("+value+") is not a valid number. Please enter number between "+str(minval)+" and max "+str(maxval))
            self.wTree.get_widget(error_box_name).show_now()
            return False
##################################################################  
#Used for controlling the behavior of the 'load policy' control when a predicate is changed..                                                    
    def loa_pred_changed(self, widget):
        wname=widget.get_name()
        if (self.wTree.get_widget(wname).get_active()==0):
            self.wTree.get_widget(wname).set_active(1)
##################################################################  
#Used to quit the client.                                                      
    def quit_app(self, widget):
        sys.exit(0)       
##################################################################  
#Used for setting the bounds on the arrow control for the number of nodes selection control.                                                              
    def entry_changed(self, widget):
        wname = widget.get_name()
        wtext = self.wTree.get_widget(wname).get_text()
        if (wname =="loa_mt"):   
            self.value_check(self, wname,wtext,0,999,"hbox19","loa_error_msg")
        else:
            print "error"
##################################################################  
#Used for setting the number of nodes required, and initializing the simulation.                                                    
    def sem_ok_clicked(self, widget):
        number_of_nodes = int(self.wTree.get_widget("sem_num_nodes").get_text())

        adjustment = gtk.Adjustment(0, 0, int(number_of_nodes)-1, 1, 0, 0)
        adjustment1 = gtk.Adjustment(0, 0, int(number_of_nodes)-1, 1, 0, 0)
        self.wTree.get_widget("loa_src").set_adjustment(adjustment)
        self.wTree.get_widget("loa_tar").set_adjustment(adjustment1)
        self.wTree.get_widget("rem_src").set_adjustment(adjustment)
        self.wTree.get_widget("rem_tar").set_adjustment(adjustment1)
        self.wTree.get_widget("ena_src").set_adjustment(adjustment)
        self.wTree.get_widget("ena_tar").set_adjustment(adjustment1)
        self.wTree.get_widget("dis_src").set_adjustment(adjustment)
        self.wTree.get_widget("dis_tar").set_adjustment(adjustment1)
        self.wTree.get_widget("eve_src").set_adjustment(adjustment)
        self.wTree.get_widget("eve_tar").set_adjustment(adjustment1)
        try:
            if (self.proxy.initialize(number_of_nodes) == 1):
                print "Server online. Nodes initialized."
                self.wTree.get_widget("sem_ok").hide()
                self.sim_started = True
            else:
                error("Invalid number of nodes specified.")
        except socket.error:
            error("Connection to TOSServ failed.")
##################################################################  
#Used for triggering the 'load policy' policy action.  
    def loa_ok_clicked(self, widget):
        if (self.sim_started):
            loa_screen_list=[]
            loa_screen_list.append(int(self.wTree.get_widget("loa_mt").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_src").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_tar").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_policyid").get_text()))
            loa_screen_list.append(self.wTree.get_widget("loa_pred").get_active())
            loa_screen_list.append(self.wTree.get_widget("loa_eventid").get_active())
            loa_screen_list.append(self.wTree.get_widget("loa_actionid").get_active())
            loa_screen_list.append(int(self.wTree.get_widget("loa_pred_desc").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_action_desc").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_pred_arg_1").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_pred_arg_2").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_pred_arg_3").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_action_arg_1").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_action_arg_2").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_action_arg_3").get_text()))
            loa_screen_list.append(int(self.wTree.get_widget("loa_action_arg_4").get_text()))
            try:
                if (self.proxy.load_policy(loa_screen_list) == 1):
                    print "Policy message sent."
                else:
                    error("Policy message did not execute successfully.")
            except socket.error:
                error("Connection to TOSServ failed.")       
##################################################################  
#Used for triggering the 'remove policy' policy action.  
    def rem_ok_clicked(self, widget):
        if (self.sim_started):
            rem_screen_list=[]
            rem_screen_list.append(int(self.wTree.get_widget("rem_mt").get_text()))
            rem_screen_list.append(int(self.wTree.get_widget("rem_src").get_text()))
            rem_screen_list.append(int(self.wTree.get_widget("rem_tar").get_text()))
            rem_screen_list.append(int(self.wTree.get_widget("rem_policyid").get_text()))
            try:
                if (self.proxy.remove_policy(rem_screen_list) == 1):
                    print "Policy message sent."
                else:
                    error("Policy message did not execute successfully.")
            except socket.error:
                error("Connection to TOSServ failed.")
##################################################################  
#Used for triggering the 'enable policy' policy action. 
    def ena_ok_clicked(self, widget):
        if (self.sim_started):
            ena_screen_list = []
            ena_screen_list.append(int(self.wTree.get_widget("ena_mt").get_text()))
            ena_screen_list.append(int(self.wTree.get_widget("ena_src").get_text()))
            ena_screen_list.append(int(self.wTree.get_widget("ena_tar").get_text()))
            ena_screen_list.append(int(self.wTree.get_widget("ena_policyid").get_text()))
            try:
                if (self.proxy.enable_policy(ena_screen_list) == 1):
                    print "Policy message sent."
                else:
                    error("Policy message did not execute successfully.")
            except socket.error:
                error("Connection to TOSServ failed.")
##################################################################  
#Used for triggering the 'disable policy' policy action.  
    def dis_ok_clicked(self, widget):
        if (self.sim_started):
            dis_screen_list=[]
            dis_screen_list.append(int(self.wTree.get_widget("dis_mt").get_text()))
            dis_screen_list.append(int(self.wTree.get_widget("dis_src").get_text()))
            dis_screen_list.append(int(self.wTree.get_widget("dis_tar").get_text()))
            dis_screen_list.append(int(self.wTree.get_widget("dis_policyid").get_text()))
            try:
                if (self.proxy.disable_policy(dis_screen_list) == 1):
                    print "Policy message sent."
                else:
                    error("Policy message did not execute successfully.")
            except socket.error:
                error("Connection to TOSServ failed.")
##################################################################  
#Used for triggering the 'trigger event' policy action.  
    def eve_ok_clicked(self, widget):
        if (self.sim_started):
            eve_screen_list=[]
            eve_screen_list.append(int(self.wTree.get_widget("eve_mt").get_text()))
            eve_screen_list.append(int(self.wTree.get_widget("eve_src").get_text()))
            eve_screen_list.append(int(self.wTree.get_widget("eve_tar").get_text()))
            eve_screen_list.append(self.wTree.get_widget("eve_eventid").get_active())
            try:
                if (self.proxy.event_policy(eve_screen_list) == 1):
                    print "Policy message sent."
                else:
                    error("Policy message did not execute successfully.")
            except socket.error:
                error("Connection to TOSServ failed.")
##################################################################  
#Used to display the correct GUI elements corresponding to the tabs on the GUI.  
    def check_page(self, widget, pageRef, pageIndex):
        if (pageIndex==5):
            elist=["Evt_network_Receive = 1", "Evt_buffer_Full = 2", 
                   "Evt_fault_TrendDrifting = 3", "Evt_fault_CorrDrifting = 4", 
                   "Evt_boot_Done = 5", "Evt_Timer_Off = 6", 
                   "Evt_mission_Installed = 7", "Evt_mission_Removed = 8", 
                   "Evt_policy_Installed = 9", "Evt_policy_Removed = 10", 
                   "Evt_role_Assigned = 11", "Evt_serial_Receive = 12", 
                   "Evt_sensor_Reading = 13"]
            combo_box2 = self.wTree.get_widget("eve_eventid")
            for p in elist:
                combo_box2.append_text(p)
                combo_box2.set_active(6)              
        elif (pageIndex==6): # log text tab
            self.display_log()
        elif (pageIndex==1): #load page tab
                plist=["Pre_arith_add = 1", "Pre_arith_sub = 2",
                       "Pre_arith_mul = 3", "Pre_arith_div = 4",
                       "Pre_network_IsAvail = 5", "Pre_mission_IsActive = 6",
                       "Pre_assoc_equal = 7", "Pre_assoc_notequal = 8",
                       "Pre_assoc_lessequal = 9", "Pre_assoc_less = 10",
                       "Pre_assoc_moreequal = 11", "Pre_assoc_more = 12",
                       "Pre_assoc_always = 13", "Pre_assoc_never = 14",
                       "Pre_logic_and = 15", "Pre_logic_or = 16", 
                       "Pre_logic_not = 17", "Pre_sensor_IsOk = 18", 
                       "Pre_math_abs = 19"]
                elist=["Evt_network_Receive = 1", "Evt_buffer_Full = 2", 
                       "Evt_fault_TrendDrifting = 3", "Evt_fault_CorrDrifting = 4", 
                       "Evt_boot_Done = 5", "Evt_Timer_Off = 6", 
                       "Evt_mission_Installed = 7", "Evt_mission_Removed = 8", 
                       "Evt_policy_Installed = 9", "Evt_policy_Removed = 10", 
                       "Evt_role_Assigned = 11", "Evt_serial_Receive = 12", 
                       "Evt_sensor_Reading = 13"]
                alist=["Act_led_Toggle = 1",
                       "Act_network_BCast = 2",
                       "Act_network_Send = 3",
                       "Act_power_Level = 4",
                       "Act_buffer_Create = 5",
                       "Act_buffer_Add = 6",
                       "Act_buffer_Get = 7",
                       "Act_fault_detect = 8",
                       "Act_feature_Avg = 9",
                       "Act_feature_Median = 10",
                       "Act_feature_Variance = 11",
                       "Act_feature_CorrCoef = 12",
                       "Act_timer_OneShot = 13",
                       "Act_timer_Periodic = 14",
                       "Act_mission_Install = 15",
                       "Act_mission_Remove = 16",
                       "Act_role_Install = 17",
                       "Act_sensor_Sense = 18",
                       "Act_sensor_Get = 19"]
                combo_box1=self.wTree.get_widget("loa_pred")
                for p in plist:
                    combo_box1.append_text(p)
                combo_box1.set_active(7)       
                combo_box2=self.wTree.get_widget("loa_eventid")
                for p in elist:
                    combo_box2.append_text(p)
                combo_box2.set_active(6)   
                combo_box3=self.wTree.get_widget("loa_actionid")
                for p in alist:
                    combo_box3.append_text(p)
                combo_box3.set_active(1)                       
##################################################################  
#Used to display the log data when the log tab is opened.      
    def display_log(self):            
        #Capture the log binary data from the server and write it locally.
        with open("local_log.txt", "wb") as handle:
            try:
                handle.write(self.proxy.read_log().data)
                print "Local log file written. Closing."
            except socket.error:
                error("Connection to TOSServ failed.")
            except:
                error("Local log file could not be written.")

        #Clear out the old log data from the text buffer.
        text_view=self.wTree.get_widget("log_txt")
        startiter = text_view.get_buffer().get_start_iter()
        enditer = text_view.get_buffer().get_end_iter()
        text_view.get_buffer().delete(startiter,enditer)
        
        #Open the captured data and load it into the text buffer.
        try:
            with open("local_log.txt", "r") as handle:
                lines = handle.readline()
                while (lines != ''):
                    text_view.get_buffer().insert(text_view.get_buffer().get_end_iter(),"\n" + lines)
                    lines = handle.readline()
        except:
            error("Local log file could not be read.")
            
        #Scroll to the end of the log.
        text_view.scroll_to_mark(text_view.get_buffer().get_insert(), 0)                         
#################
#################
#Main:
gui = FingerII_GUI()

gtk.main() 