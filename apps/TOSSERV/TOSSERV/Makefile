COMPONENT=../src/configurations/DemoAppC
PFLAGS+=-I../src/headers 
PFLAGS+=-I../src/components 
PFLAGS+=-I../src/configurations 
PFLAGS+=-I../src/core 
PFLAGS+=-I../src/interfaces 
PFLAGS+=-I../src/components/assoc 
PFLAGS+=-I../src/components/timer 
PFLAGS+=-I../src/components/led 
CFLAGS += $(INCLUDES)

BUILD_EXTRA_DEPS += fingerIIRequestMsg.py fingerIIRequestMsg.class fingerIIResponseMsg.py fingerIIResponseMsg.class
CLEAN_EXTRA += fingerIIRequestMsg.py fingerIIRequestMsg.class fingerIIRequestMsg.java fingerIIResponseMsg.py fingerIIResponseMsg.class

fingerIIRequestMsg.py: Messages.h 
	mig python -target=$(PLATFORM) $(CFLAGS) -python-classname=fingerIIRequestMsg Messages.h RequestMsg -o $@

fingerIIRequestMsg.class: fingerIIRequestMsg.java
	javac fingerIIRequestMsg.java
	
fingerIIRequestMsg.java: Messages.h
	mig java -target=$(PLATFORM) $(CFLAGS) -java-classname=fingerIIRequestMsg Messages.h RequestMsg -o $@ 
	
fingerIIResponseMsg.py: Messages.h 
	mig python -target=$(PLATFORM) $(CFLAGS) -python-classname=fingerIIResponseMsg Messages.h ResponseMsg -o $@
		

fingerIIResponseMsg.class: fingerIIResponseMsg.java
	javac fingerIIResponseMsg.java
	
fingerIIResponseMsg.java: Messages.h
	mig java -target=$(PLATFORM) $(CFLAGS) -java-classname=fingerIIResponseMsg Messages.h ResponseMsg -o $@ 
	
include $(MAKERULES)
