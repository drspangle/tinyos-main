#
# This class is automatically generated by mig. DO NOT EDIT THIS FILE.
# This class implements a Python interface to the 'fingerIIRequestMsg'
# message type.
#

import tinyos.message.Message

# The default size of this message type in bytes.
DEFAULT_MESSAGE_SIZE = 24

# The Active Message type associated with this message.
AM_TYPE = -1

class fingerIIRequestMsg(tinyos.message.Message.Message):
    # Create a new fingerIIRequestMsg of size 24.
    def __init__(self, data="", addr=None, gid=None, base_offset=0, data_length=24):
        tinyos.message.Message.Message.__init__(self, data, addr, gid, base_offset, data_length)
        self.amTypeSet(AM_TYPE)
    
    # Get AM_TYPE
    def get_amType(cls):
        return AM_TYPE
    
    get_amType = classmethod(get_amType)
    
    #
    # Return a String representation of this message. Includes the
    # message type name and the non-indexed field values.
    #
    def __str__(self):
        s = "Message <fingerIIRequestMsg> \n"
        try:
            s += "  [source=0x%x]\n" % (self.get_source())
        except:
            pass
        try:
            s += "  [target=0x%x]\n" % (self.get_target())
        except:
            pass
        try:
            s += "  [request=0x%x]\n" % (self.get_request())
        except:
            pass
        try:
            s += "  [seq=0x%x]\n" % (self.get_seq())
        except:
            pass
        try:
            s += "  [context.policyId=0x%x]\n" % (self.get_context_policyId())
        except:
            pass
        try:
            s += "  [context.oblPolicy.policyId=0x%x]\n" % (self.get_context_oblPolicy_policyId())
        except:
            pass
        try:
            s += "  [context.oblPolicy.predicateId=0x%x]\n" % (self.get_context_oblPolicy_predicateId())
        except:
            pass
        try:
            s += "  [context.oblPolicy.eventId=0x%x]\n" % (self.get_context_oblPolicy_eventId())
        except:
            pass
        try:
            s += "  [context.oblPolicy.actionId=0x%x]\n" % (self.get_context_oblPolicy_actionId())
        except:
            pass
        try:
            s += "  [context.oblPolicy.preArgDesc=0x%x]\n" % (self.get_context_oblPolicy_preArgDesc())
        except:
            pass
        try:
            s += "  [context.oblPolicy.actArgDesc=0x%x]\n" % (self.get_context_oblPolicy_actArgDesc())
        except:
            pass
        try:
            s += "  [context.oblPolicy.predicateArgs=";
            for i in range(0, 3):
                s += "0x%x " % (self.getElement_context_oblPolicy_predicateArgs(i) & 0xff)
            s += "]\n";
        except:
            pass
        try:
            s += "  [context.oblPolicy.actionArgs=";
            for i in range(0, 4):
                s += "0x%x " % (self.getElement_context_oblPolicy_actionArgs(i) & 0xff)
            s += "]\n";
        except:
            pass
        try:
            s += "  [context.evt.eventId=0x%x]\n" % (self.get_context_evt_eventId())
        except:
            pass
        try:
            s += "  [context.evt.args=";
            for i in range(0, 1):
                s += "0x%x " % (self.getElement_context_evt_args(i) & 0xff)
            s += "]\n";
        except:
            pass
        return s

    # Message-type-specific access methods appear below.

    #
    # Accessor methods for field: source
    #   Field type: short
    #   Offset (bits): 0
    #   Size (bits): 8
    #

    #
    # Return whether the field 'source' is signed (False).
    #
    def isSigned_source(self):
        return False
    
    #
    # Return whether the field 'source' is an array (False).
    #
    def isArray_source(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'source'
    #
    def offset_source(self):
        return (0 / 8)
    
    #
    # Return the offset (in bits) of the field 'source'
    #
    def offsetBits_source(self):
        return 0
    
    #
    # Return the value (as a short) of the field 'source'
    #
    def get_source(self):
        return self.getUIntElement(self.offsetBits_source(), 8, 0)
    
    #
    # Set the value of the field 'source'
    #
    def set_source(self, value):
        self.setUIntElement(self.offsetBits_source(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'source'
    #
    def size_source(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'source'
    #
    def sizeBits_source(self):
        return 8
    
    #
    # Accessor methods for field: target
    #   Field type: short
    #   Offset (bits): 8
    #   Size (bits): 8
    #

    #
    # Return whether the field 'target' is signed (False).
    #
    def isSigned_target(self):
        return False
    
    #
    # Return whether the field 'target' is an array (False).
    #
    def isArray_target(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'target'
    #
    def offset_target(self):
        return (8 / 8)
    
    #
    # Return the offset (in bits) of the field 'target'
    #
    def offsetBits_target(self):
        return 8
    
    #
    # Return the value (as a short) of the field 'target'
    #
    def get_target(self):
        return self.getUIntElement(self.offsetBits_target(), 8, 0)
    
    #
    # Set the value of the field 'target'
    #
    def set_target(self, value):
        self.setUIntElement(self.offsetBits_target(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'target'
    #
    def size_target(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'target'
    #
    def sizeBits_target(self):
        return 8
    
    #
    # Accessor methods for field: request
    #   Field type: short
    #   Offset (bits): 16
    #   Size (bits): 8
    #

    #
    # Return whether the field 'request' is signed (False).
    #
    def isSigned_request(self):
        return False
    
    #
    # Return whether the field 'request' is an array (False).
    #
    def isArray_request(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'request'
    #
    def offset_request(self):
        return (16 / 8)
    
    #
    # Return the offset (in bits) of the field 'request'
    #
    def offsetBits_request(self):
        return 16
    
    #
    # Return the value (as a short) of the field 'request'
    #
    def get_request(self):
        return self.getUIntElement(self.offsetBits_request(), 8, 0)
    
    #
    # Set the value of the field 'request'
    #
    def set_request(self, value):
        self.setUIntElement(self.offsetBits_request(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'request'
    #
    def size_request(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'request'
    #
    def sizeBits_request(self):
        return 8
    
    #
    # Accessor methods for field: seq
    #   Field type: short
    #   Offset (bits): 24
    #   Size (bits): 8
    #

    #
    # Return whether the field 'seq' is signed (False).
    #
    def isSigned_seq(self):
        return False
    
    #
    # Return whether the field 'seq' is an array (False).
    #
    def isArray_seq(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'seq'
    #
    def offset_seq(self):
        return (24 / 8)
    
    #
    # Return the offset (in bits) of the field 'seq'
    #
    def offsetBits_seq(self):
        return 24
    
    #
    # Return the value (as a short) of the field 'seq'
    #
    def get_seq(self):
        return self.getUIntElement(self.offsetBits_seq(), 8, 0)
    
    #
    # Set the value of the field 'seq'
    #
    def set_seq(self, value):
        self.setUIntElement(self.offsetBits_seq(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'seq'
    #
    def size_seq(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'seq'
    #
    def sizeBits_seq(self):
        return 8
    
    #
    # Accessor methods for field: context.policyId
    #   Field type: short
    #   Offset (bits): 32
    #   Size (bits): 8
    #

    #
    # Return whether the field 'context.policyId' is signed (False).
    #
    def isSigned_context_policyId(self):
        return False
    
    #
    # Return whether the field 'context.policyId' is an array (False).
    #
    def isArray_context_policyId(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'context.policyId'
    #
    def offset_context_policyId(self):
        return (32 / 8)
    
    #
    # Return the offset (in bits) of the field 'context.policyId'
    #
    def offsetBits_context_policyId(self):
        return 32
    
    #
    # Return the value (as a short) of the field 'context.policyId'
    #
    def get_context_policyId(self):
        return self.getUIntElement(self.offsetBits_context_policyId(), 8, 0)
    
    #
    # Set the value of the field 'context.policyId'
    #
    def set_context_policyId(self, value):
        self.setUIntElement(self.offsetBits_context_policyId(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'context.policyId'
    #
    def size_context_policyId(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'context.policyId'
    #
    def sizeBits_context_policyId(self):
        return 8
    
    #
    # Accessor methods for field: context.oblPolicy.policyId
    #   Field type: short
    #   Offset (bits): 32
    #   Size (bits): 8
    #

    #
    # Return whether the field 'context.oblPolicy.policyId' is signed (False).
    #
    def isSigned_context_oblPolicy_policyId(self):
        return False
    
    #
    # Return whether the field 'context.oblPolicy.policyId' is an array (False).
    #
    def isArray_context_oblPolicy_policyId(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'context.oblPolicy.policyId'
    #
    def offset_context_oblPolicy_policyId(self):
        return (32 / 8)
    
    #
    # Return the offset (in bits) of the field 'context.oblPolicy.policyId'
    #
    def offsetBits_context_oblPolicy_policyId(self):
        return 32
    
    #
    # Return the value (as a short) of the field 'context.oblPolicy.policyId'
    #
    def get_context_oblPolicy_policyId(self):
        return self.getUIntElement(self.offsetBits_context_oblPolicy_policyId(), 8, 0)
    
    #
    # Set the value of the field 'context.oblPolicy.policyId'
    #
    def set_context_oblPolicy_policyId(self, value):
        self.setUIntElement(self.offsetBits_context_oblPolicy_policyId(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'context.oblPolicy.policyId'
    #
    def size_context_oblPolicy_policyId(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'context.oblPolicy.policyId'
    #
    def sizeBits_context_oblPolicy_policyId(self):
        return 8
    
    #
    # Accessor methods for field: context.oblPolicy.predicateId
    #   Field type: short
    #   Offset (bits): 40
    #   Size (bits): 8
    #

    #
    # Return whether the field 'context.oblPolicy.predicateId' is signed (False).
    #
    def isSigned_context_oblPolicy_predicateId(self):
        return False
    
    #
    # Return whether the field 'context.oblPolicy.predicateId' is an array (False).
    #
    def isArray_context_oblPolicy_predicateId(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'context.oblPolicy.predicateId'
    #
    def offset_context_oblPolicy_predicateId(self):
        return (40 / 8)
    
    #
    # Return the offset (in bits) of the field 'context.oblPolicy.predicateId'
    #
    def offsetBits_context_oblPolicy_predicateId(self):
        return 40
    
    #
    # Return the value (as a short) of the field 'context.oblPolicy.predicateId'
    #
    def get_context_oblPolicy_predicateId(self):
        return self.getUIntElement(self.offsetBits_context_oblPolicy_predicateId(), 8, 0)
    
    #
    # Set the value of the field 'context.oblPolicy.predicateId'
    #
    def set_context_oblPolicy_predicateId(self, value):
        self.setUIntElement(self.offsetBits_context_oblPolicy_predicateId(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'context.oblPolicy.predicateId'
    #
    def size_context_oblPolicy_predicateId(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'context.oblPolicy.predicateId'
    #
    def sizeBits_context_oblPolicy_predicateId(self):
        return 8
    
    #
    # Accessor methods for field: context.oblPolicy.eventId
    #   Field type: short
    #   Offset (bits): 48
    #   Size (bits): 8
    #

    #
    # Return whether the field 'context.oblPolicy.eventId' is signed (False).
    #
    def isSigned_context_oblPolicy_eventId(self):
        return False
    
    #
    # Return whether the field 'context.oblPolicy.eventId' is an array (False).
    #
    def isArray_context_oblPolicy_eventId(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'context.oblPolicy.eventId'
    #
    def offset_context_oblPolicy_eventId(self):
        return (48 / 8)
    
    #
    # Return the offset (in bits) of the field 'context.oblPolicy.eventId'
    #
    def offsetBits_context_oblPolicy_eventId(self):
        return 48
    
    #
    # Return the value (as a short) of the field 'context.oblPolicy.eventId'
    #
    def get_context_oblPolicy_eventId(self):
        return self.getUIntElement(self.offsetBits_context_oblPolicy_eventId(), 8, 0)
    
    #
    # Set the value of the field 'context.oblPolicy.eventId'
    #
    def set_context_oblPolicy_eventId(self, value):
        self.setUIntElement(self.offsetBits_context_oblPolicy_eventId(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'context.oblPolicy.eventId'
    #
    def size_context_oblPolicy_eventId(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'context.oblPolicy.eventId'
    #
    def sizeBits_context_oblPolicy_eventId(self):
        return 8
    
    #
    # Accessor methods for field: context.oblPolicy.actionId
    #   Field type: short
    #   Offset (bits): 56
    #   Size (bits): 8
    #

    #
    # Return whether the field 'context.oblPolicy.actionId' is signed (False).
    #
    def isSigned_context_oblPolicy_actionId(self):
        return False
    
    #
    # Return whether the field 'context.oblPolicy.actionId' is an array (False).
    #
    def isArray_context_oblPolicy_actionId(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'context.oblPolicy.actionId'
    #
    def offset_context_oblPolicy_actionId(self):
        return (56 / 8)
    
    #
    # Return the offset (in bits) of the field 'context.oblPolicy.actionId'
    #
    def offsetBits_context_oblPolicy_actionId(self):
        return 56
    
    #
    # Return the value (as a short) of the field 'context.oblPolicy.actionId'
    #
    def get_context_oblPolicy_actionId(self):
        return self.getUIntElement(self.offsetBits_context_oblPolicy_actionId(), 8, 0)
    
    #
    # Set the value of the field 'context.oblPolicy.actionId'
    #
    def set_context_oblPolicy_actionId(self, value):
        self.setUIntElement(self.offsetBits_context_oblPolicy_actionId(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'context.oblPolicy.actionId'
    #
    def size_context_oblPolicy_actionId(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'context.oblPolicy.actionId'
    #
    def sizeBits_context_oblPolicy_actionId(self):
        return 8
    
    #
    # Accessor methods for field: context.oblPolicy.preArgDesc
    #   Field type: short
    #   Offset (bits): 64
    #   Size (bits): 8
    #

    #
    # Return whether the field 'context.oblPolicy.preArgDesc' is signed (False).
    #
    def isSigned_context_oblPolicy_preArgDesc(self):
        return False
    
    #
    # Return whether the field 'context.oblPolicy.preArgDesc' is an array (False).
    #
    def isArray_context_oblPolicy_preArgDesc(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'context.oblPolicy.preArgDesc'
    #
    def offset_context_oblPolicy_preArgDesc(self):
        return (64 / 8)
    
    #
    # Return the offset (in bits) of the field 'context.oblPolicy.preArgDesc'
    #
    def offsetBits_context_oblPolicy_preArgDesc(self):
        return 64
    
    #
    # Return the value (as a short) of the field 'context.oblPolicy.preArgDesc'
    #
    def get_context_oblPolicy_preArgDesc(self):
        return self.getUIntElement(self.offsetBits_context_oblPolicy_preArgDesc(), 8, 0)
    
    #
    # Set the value of the field 'context.oblPolicy.preArgDesc'
    #
    def set_context_oblPolicy_preArgDesc(self, value):
        self.setUIntElement(self.offsetBits_context_oblPolicy_preArgDesc(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'context.oblPolicy.preArgDesc'
    #
    def size_context_oblPolicy_preArgDesc(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'context.oblPolicy.preArgDesc'
    #
    def sizeBits_context_oblPolicy_preArgDesc(self):
        return 8
    
    #
    # Accessor methods for field: context.oblPolicy.actArgDesc
    #   Field type: short
    #   Offset (bits): 72
    #   Size (bits): 8
    #

    #
    # Return whether the field 'context.oblPolicy.actArgDesc' is signed (False).
    #
    def isSigned_context_oblPolicy_actArgDesc(self):
        return False
    
    #
    # Return whether the field 'context.oblPolicy.actArgDesc' is an array (False).
    #
    def isArray_context_oblPolicy_actArgDesc(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'context.oblPolicy.actArgDesc'
    #
    def offset_context_oblPolicy_actArgDesc(self):
        return (72 / 8)
    
    #
    # Return the offset (in bits) of the field 'context.oblPolicy.actArgDesc'
    #
    def offsetBits_context_oblPolicy_actArgDesc(self):
        return 72
    
    #
    # Return the value (as a short) of the field 'context.oblPolicy.actArgDesc'
    #
    def get_context_oblPolicy_actArgDesc(self):
        return self.getUIntElement(self.offsetBits_context_oblPolicy_actArgDesc(), 8, 0)
    
    #
    # Set the value of the field 'context.oblPolicy.actArgDesc'
    #
    def set_context_oblPolicy_actArgDesc(self, value):
        self.setUIntElement(self.offsetBits_context_oblPolicy_actArgDesc(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'context.oblPolicy.actArgDesc'
    #
    def size_context_oblPolicy_actArgDesc(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'context.oblPolicy.actArgDesc'
    #
    def sizeBits_context_oblPolicy_actArgDesc(self):
        return 8
    
    #
    # Accessor methods for field: context.oblPolicy.predicateArgs
    #   Field type: int[]
    #   Offset (bits): 80
    #   Size of each element (bits): 16
    #

    #
    # Return whether the field 'context.oblPolicy.predicateArgs' is signed (False).
    #
    def isSigned_context_oblPolicy_predicateArgs(self):
        return False
    
    #
    # Return whether the field 'context.oblPolicy.predicateArgs' is an array (True).
    #
    def isArray_context_oblPolicy_predicateArgs(self):
        return True
    
    #
    # Return the offset (in bytes) of the field 'context.oblPolicy.predicateArgs'
    #
    def offset_context_oblPolicy_predicateArgs(self, index1):
        offset = 80
        if index1 < 0 or index1 >= 3:
            raise IndexError
        offset += 0 + index1 * 16
        return (offset / 8)
    
    #
    # Return the offset (in bits) of the field 'context.oblPolicy.predicateArgs'
    #
    def offsetBits_context_oblPolicy_predicateArgs(self, index1):
        offset = 80
        if index1 < 0 or index1 >= 3:
            raise IndexError
        offset += 0 + index1 * 16
        return offset
    
    #
    # Return the entire array 'context.oblPolicy.predicateArgs' as a int[]
    #
    def get_context_oblPolicy_predicateArgs(self):
        tmp = [None]*3
        for index0 in range (0, self.numElements_context_oblPolicy_predicateArgs(0)):
                tmp[index0] = self.getElement_context_oblPolicy_predicateArgs(index0)
        return tmp
    
    #
    # Set the contents of the array 'context.oblPolicy.predicateArgs' from the given int[]
    #
    def set_context_oblPolicy_predicateArgs(self, value):
        for index0 in range(0, len(value)):
            self.setElement_context_oblPolicy_predicateArgs(index0, value[index0])

    #
    # Return an element (as a int) of the array 'context.oblPolicy.predicateArgs'
    #
    def getElement_context_oblPolicy_predicateArgs(self, index1):
        return self.getUIntElement(self.offsetBits_context_oblPolicy_predicateArgs(index1), 16, 0)
    
    #
    # Set an element of the array 'context.oblPolicy.predicateArgs'
    #
    def setElement_context_oblPolicy_predicateArgs(self, index1, value):
        self.setUIntElement(self.offsetBits_context_oblPolicy_predicateArgs(index1), 16, value, 0)
    
    #
    # Return the total size, in bytes, of the array 'context.oblPolicy.predicateArgs'
    #
    def totalSize_context_oblPolicy_predicateArgs(self):
        return (48 / 8)
    
    #
    # Return the total size, in bits, of the array 'context.oblPolicy.predicateArgs'
    #
    def totalSizeBits_context_oblPolicy_predicateArgs(self):
        return 48
    
    #
    # Return the size, in bytes, of each element of the array 'context.oblPolicy.predicateArgs'
    #
    def elementSize_context_oblPolicy_predicateArgs(self):
        return (16 / 8)
    
    #
    # Return the size, in bits, of each element of the array 'context.oblPolicy.predicateArgs'
    #
    def elementSizeBits_context_oblPolicy_predicateArgs(self):
        return 16
    
    #
    # Return the number of dimensions in the array 'context.oblPolicy.predicateArgs'
    #
    def numDimensions_context_oblPolicy_predicateArgs(self):
        return 1
    
    #
    # Return the number of elements in the array 'context.oblPolicy.predicateArgs'
    #
    def numElements_context_oblPolicy_predicateArgs():
        return 3
    
    #
    # Return the number of elements in the array 'context.oblPolicy.predicateArgs'
    # for the given dimension.
    #
    def numElements_context_oblPolicy_predicateArgs(self, dimension):
        array_dims = [ 3,  ]
        if dimension < 0 or dimension >= 1:
            raise IndexException
        if array_dims[dimension] == 0:
            raise IndexError
        return array_dims[dimension]
    
    #
    # Accessor methods for field: context.oblPolicy.actionArgs
    #   Field type: int[]
    #   Offset (bits): 128
    #   Size of each element (bits): 16
    #

    #
    # Return whether the field 'context.oblPolicy.actionArgs' is signed (False).
    #
    def isSigned_context_oblPolicy_actionArgs(self):
        return False
    
    #
    # Return whether the field 'context.oblPolicy.actionArgs' is an array (True).
    #
    def isArray_context_oblPolicy_actionArgs(self):
        return True
    
    #
    # Return the offset (in bytes) of the field 'context.oblPolicy.actionArgs'
    #
    def offset_context_oblPolicy_actionArgs(self, index1):
        offset = 128
        if index1 < 0 or index1 >= 4:
            raise IndexError
        offset += 0 + index1 * 16
        return (offset / 8)
    
    #
    # Return the offset (in bits) of the field 'context.oblPolicy.actionArgs'
    #
    def offsetBits_context_oblPolicy_actionArgs(self, index1):
        offset = 128
        if index1 < 0 or index1 >= 4:
            raise IndexError
        offset += 0 + index1 * 16
        return offset
    
    #
    # Return the entire array 'context.oblPolicy.actionArgs' as a int[]
    #
    def get_context_oblPolicy_actionArgs(self):
        tmp = [None]*4
        for index0 in range (0, self.numElements_context_oblPolicy_actionArgs(0)):
                tmp[index0] = self.getElement_context_oblPolicy_actionArgs(index0)
        return tmp
    
    #
    # Set the contents of the array 'context.oblPolicy.actionArgs' from the given int[]
    #
    def set_context_oblPolicy_actionArgs(self, value):
        for index0 in range(0, len(value)):
            self.setElement_context_oblPolicy_actionArgs(index0, value[index0])

    #
    # Return an element (as a int) of the array 'context.oblPolicy.actionArgs'
    #
    def getElement_context_oblPolicy_actionArgs(self, index1):
        return self.getUIntElement(self.offsetBits_context_oblPolicy_actionArgs(index1), 16, 0)
    
    #
    # Set an element of the array 'context.oblPolicy.actionArgs'
    #
    def setElement_context_oblPolicy_actionArgs(self, index1, value):
        self.setUIntElement(self.offsetBits_context_oblPolicy_actionArgs(index1), 16, value, 0)
    
    #
    # Return the total size, in bytes, of the array 'context.oblPolicy.actionArgs'
    #
    def totalSize_context_oblPolicy_actionArgs(self):
        return (64 / 8)
    
    #
    # Return the total size, in bits, of the array 'context.oblPolicy.actionArgs'
    #
    def totalSizeBits_context_oblPolicy_actionArgs(self):
        return 64
    
    #
    # Return the size, in bytes, of each element of the array 'context.oblPolicy.actionArgs'
    #
    def elementSize_context_oblPolicy_actionArgs(self):
        return (16 / 8)
    
    #
    # Return the size, in bits, of each element of the array 'context.oblPolicy.actionArgs'
    #
    def elementSizeBits_context_oblPolicy_actionArgs(self):
        return 16
    
    #
    # Return the number of dimensions in the array 'context.oblPolicy.actionArgs'
    #
    def numDimensions_context_oblPolicy_actionArgs(self):
        return 1
    
    #
    # Return the number of elements in the array 'context.oblPolicy.actionArgs'
    #
    def numElements_context_oblPolicy_actionArgs():
        return 4
    
    #
    # Return the number of elements in the array 'context.oblPolicy.actionArgs'
    # for the given dimension.
    #
    def numElements_context_oblPolicy_actionArgs(self, dimension):
        array_dims = [ 4,  ]
        if dimension < 0 or dimension >= 1:
            raise IndexException
        if array_dims[dimension] == 0:
            raise IndexError
        return array_dims[dimension]
    
    #
    # Accessor methods for field: context.evt.eventId
    #   Field type: short
    #   Offset (bits): 32
    #   Size (bits): 8
    #

    #
    # Return whether the field 'context.evt.eventId' is signed (False).
    #
    def isSigned_context_evt_eventId(self):
        return False
    
    #
    # Return whether the field 'context.evt.eventId' is an array (False).
    #
    def isArray_context_evt_eventId(self):
        return False
    
    #
    # Return the offset (in bytes) of the field 'context.evt.eventId'
    #
    def offset_context_evt_eventId(self):
        return (32 / 8)
    
    #
    # Return the offset (in bits) of the field 'context.evt.eventId'
    #
    def offsetBits_context_evt_eventId(self):
        return 32
    
    #
    # Return the value (as a short) of the field 'context.evt.eventId'
    #
    def get_context_evt_eventId(self):
        return self.getUIntElement(self.offsetBits_context_evt_eventId(), 8, 0)
    
    #
    # Set the value of the field 'context.evt.eventId'
    #
    def set_context_evt_eventId(self, value):
        self.setUIntElement(self.offsetBits_context_evt_eventId(), 8, value, 0)
    
    #
    # Return the size, in bytes, of the field 'context.evt.eventId'
    #
    def size_context_evt_eventId(self):
        return (8 / 8)
    
    #
    # Return the size, in bits, of the field 'context.evt.eventId'
    #
    def sizeBits_context_evt_eventId(self):
        return 8
    
    #
    # Accessor methods for field: context.evt.args
    #   Field type: int[]
    #   Offset (bits): 40
    #   Size of each element (bits): 16
    #

    #
    # Return whether the field 'context.evt.args' is signed (False).
    #
    def isSigned_context_evt_args(self):
        return False
    
    #
    # Return whether the field 'context.evt.args' is an array (True).
    #
    def isArray_context_evt_args(self):
        return True
    
    #
    # Return the offset (in bytes) of the field 'context.evt.args'
    #
    def offset_context_evt_args(self, index1):
        offset = 40
        if index1 < 0 or index1 >= 1:
            raise IndexError
        offset += 0 + index1 * 16
        return (offset / 8)
    
    #
    # Return the offset (in bits) of the field 'context.evt.args'
    #
    def offsetBits_context_evt_args(self, index1):
        offset = 40
        if index1 < 0 or index1 >= 1:
            raise IndexError
        offset += 0 + index1 * 16
        return offset
    
    #
    # Return the entire array 'context.evt.args' as a int[]
    #
    def get_context_evt_args(self):
        tmp = [None]*1
        for index0 in range (0, self.numElements_context_evt_args(0)):
                tmp[index0] = self.getElement_context_evt_args(index0)
        return tmp
    
    #
    # Set the contents of the array 'context.evt.args' from the given int[]
    #
    def set_context_evt_args(self, value):
        for index0 in range(0, len(value)):
            self.setElement_context_evt_args(index0, value[index0])

    #
    # Return an element (as a int) of the array 'context.evt.args'
    #
    def getElement_context_evt_args(self, index1):
        return self.getUIntElement(self.offsetBits_context_evt_args(index1), 16, 0)
    
    #
    # Set an element of the array 'context.evt.args'
    #
    def setElement_context_evt_args(self, index1, value):
        self.setUIntElement(self.offsetBits_context_evt_args(index1), 16, value, 0)
    
    #
    # Return the total size, in bytes, of the array 'context.evt.args'
    #
    def totalSize_context_evt_args(self):
        return (16 / 8)
    
    #
    # Return the total size, in bits, of the array 'context.evt.args'
    #
    def totalSizeBits_context_evt_args(self):
        return 16
    
    #
    # Return the size, in bytes, of each element of the array 'context.evt.args'
    #
    def elementSize_context_evt_args(self):
        return (16 / 8)
    
    #
    # Return the size, in bits, of each element of the array 'context.evt.args'
    #
    def elementSizeBits_context_evt_args(self):
        return 16
    
    #
    # Return the number of dimensions in the array 'context.evt.args'
    #
    def numDimensions_context_evt_args(self):
        return 1
    
    #
    # Return the number of elements in the array 'context.evt.args'
    #
    def numElements_context_evt_args():
        return 1
    
    #
    # Return the number of elements in the array 'context.evt.args'
    # for the given dimension.
    #
    def numElements_context_evt_args(self, dimension):
        array_dims = [ 1,  ]
        if dimension < 0 or dimension >= 1:
            raise IndexException
        if array_dims[dimension] == 0:
            raise IndexError
        return array_dims[dimension]
    
