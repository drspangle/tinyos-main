/*
* Finger2IPv6 - UDP Console Based IPv6 Policy System
* Created by Daniel Smullen
* Please report bugs to: Daniel.Smullen@uoit.net
*
* Based on Finger2 - Embedded Policy System for Sensor Networks
* Created by Themistoklis Bourdenas, modified by Nidal Qwasmi
*
* Finger2IPv6 is free software: you can redistribute it and/or modify
* it under the terms of the GNU Lesser General Public License as published
* by the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Finger2IPv6 is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
* along with Finger2.  If not, see <http://www.gnu.org/licenses/>.
*/

//Include all Finger2 Headers
#include "Common.h"
#include "Events.h"
#include "EventContext.h"
#include "Predicates.h"
#include "Actions.h"
#include "Policies.h"

//Include all IPv6 and 6LoWPAN Headers
#include <lib6lowpan/lib6lowpan.h>
#include <lib6lowpan/ip.h>
#include "blip_printf.h"

//Unused: Used for testing multihop messaging for the old AMSend Interface.
//TODO: Remove this code.
#ifndef TEST_H 
#define TEST_H

typedef nx_struct multihop_injection_msg {
  nx_uint16_t payload;
} multihop_injection_msg_t;

enum {
  AM_MULTIHOP_INJECTION_MSG = 1,
};

#endif
/////////////////////////////////////////////

//Program entry point module for Finger2IPv6.
module Finger2IPv6P
{

//Required for Finger2 Policy Platform.
provides interface EventSourceI;

  uses
  {
    interface Boot;

    //Policy Manager for Finger2
    interface PolicyManagerI;

    //Radio control used by blip IPv6 stack.
    interface SplitControl as RadioControl;

    //UDP Shell Command instances for each Finger2IPv6 Command
    interface ShellCommand as FingerIICommand0;
    interface ShellCommand as FingerIICommand1;
    interface ShellCommand as FingerIICommand2;
    interface ShellCommand as FingerIICommand3;
    interface ShellCommand as FingerIICommand4;
    interface ShellCommand as FingerIICommand5;
  } 
}

implementation
{
    //Used by blip IPv6 Stack.
    bool timerStarted;
    struct sockaddr_in6 route_dest;
    /////

    //This event is called once the component is instantiated and the system has booted.
    event void Boot.booted()
    {
      //Instantiate a policy object.
      OblPolicy_t* policy;

      //Send a debug message indicating that boot has occurred, for those listening.
      dbg("core", "PolicyLoader: booting...loading policy for timer.fire event\n"); //nq

      //Reset the timer. Required for blip IPv6 stack.
      timerStarted = 0;

      //Create a test policy.
      //Test policy written by Nidal Qwasmi, controlling LEDs.
      policy->policyId = 1; //nq
      policy->predicateId = Pre_assoc_equal; //nq
      policy->eventId = 6; //nq
      policy->actionId = 1; //nq
      policy->preArgDesc = 2; //nq control the order of argument and value in the Predicates. 
        //Example counter = 3 that 0 means the parameter value would be at the left side of the formula, 
        //1 means parameter is at the right side of the formula   
      policy->actArgDesc = 0; //nq same as preArgDesc (if needed)
      policy->predicateArgs[0] = 3; //nq the first value of the predicate 
      policy->predicateArgs[1] = 0; //nq the second value of the predicate
      policy->predicateArgs[2] = 0; //nq the third value of the predicate
      policy->actionArgs[0] = 1; //nq action first parameter (such as led number)
      policy->actionArgs[1] = 0; //nq action second parameter (such as led number)
      policy->actionArgs[2] = 0 ; //nq action third parameter (such as led number)
      policy->actionArgs[3] = 0; //nq action forth parameter (such as led number)
      call PolicyManagerI.LoadPolicy(policy); //nq

      policy->policyId = 2; //nq
      policy->predicateId = Pre_assoc_equal; //nq
      policy->eventId = 6; //nq
      policy->actionId = 1; //nq
      policy->preArgDesc = 2; //nq control the order of argument and value in the Predicates. 
        //Example counter = 3 that 0 means the parameter value would be at the left side of the formula, 
        //1 means parameter is at the right side of the formula   
      policy->actArgDesc = 0; //nq same as preArgDesc (if needed)
      policy->predicateArgs[0] = 3; //nq the first value of the predicate 
      policy->predicateArgs[1] = 0; //nq the second value of the predicate
      policy->predicateArgs[2] = 0; //nq the third value of the predicate
      policy->actionArgs[0] = 2; //nq action first parameter (such as led number)
      policy->actionArgs[1] = 0; //nq action second parameter (such as led number)
      policy->actionArgs[2] = 0 ; //nq action third parameter (such as led number)
      policy->actionArgs[3] = 0; //nq action forth parameter (such as led number)

      //Initiate the IPv6 stack's handle to the radio.
      call RadioControl.start();
  }


  //Unused. Event fired when a message is received on the radio.
  event void RadioControl.startDone(error_t e) {
  }

  //Unused. Event fired when the message is received.
  event void RadioControl.stopDone(error_t e) {

  } 

  //Help for Finger2 (f2help)
  //Invoked when 'f2help' is entered into the UDP console.
  //Outputs help information to the screen.
  //Accepts one argument, for specific help concerning which Finger2IPv6 command you want help for.
  event char *FingerIICommand0.eval(int argc, char **argv) {
    char *ret = call FingerIICommand0.getBuffer(83);
      
      if (strncmp(argv[1],"trigger", 7) == 0)
      {
        call FingerIICommand0.write("\ntrigger <eventId> [arg1 .. 14]\n",32);
        call FingerIICommand0.write("Trigger event with ID <eventId>, and include arguments where applicable.\n\n",74);
      }
      else if (strncmp(argv[1],"load",4) == 0)
      {
        call FingerIICommand0.write("\nload <policyId> <predicateId> <eventId> <actionId> <preArgDesc> <actArgDesc> [predicateArg1 ... 2] [actionArg1 ... 4]\n",119);
        call FingerIICommand0.write("Load a policy, supplying the neccesary parameters.\n\n",52);
      }
      else if (strncmp(argv[1],"remove",6) == 0)
      {
        call FingerIICommand0.write("\nremove <policyId>\n",19);
        call FingerIICommand0.write("Remove policy with ID <policyId>.\n\n",35);
      }
      else if (strncmp(argv[1],"enable",6) == 0)
      {
        call FingerIICommand0.write("\nenable <policyId>\n",19);
        call FingerIICommand0.write("Enable policy with ID <policyId>.\n\n",35);
      }
      else if (strncmp(argv[1],"disable",7) == 0)
      {
        call FingerIICommand0.write("\ndisable <policyId>\n",20);
        call FingerIICommand0.write("Disable policy with ID <policyId>.\n\n",36);
      }
      else
      {
        call FingerIICommand0.write("\nUsage: f2help <command>\n\n",25);
      }

      ret = "\nFinger Commands\nCreated by Daniel Smullen\nReport bugs to: Daniel.Smullen@uoit.net\n";

      return ret;
  }

  //Trigger Event (trigger)
  //Invoked when 'trigger' is entered into the console, with respective parameters.
  //Invokes an event which has been wired into the Finger2 core.
  //Accepts up to 14 arguments. Upon invocation, outputs status information to the console.
  event char *FingerIICommand1.eval(int argc, char **argv) {
    //Get a buffer to return output to the console. If no memory is available, don't run the command to prevent a crash.
    char *ret = call FingerIICommand1.getBuffer(16);

    //Allocate a buffer to store the argument list.
    argument_t* ArgList = (argument_t*) malloc(sizeof(argument_t)*14);

    int i = 0;

    if (ret != NULL) {
        event_t eventArg = (event_t) atoi(argv[1]);

        //Load the event arguments.
        //MAX NUMBER OF SHELL ARGS IS 14
        for(;i < 14; ++i)
          ArgList[i] = (argument_t) atoi(argv[2+i]);

      //Invoke the event.
      signal EventSourceI.evt(eventArg, ArgList);

      //TODO: To prevent a memory leak, ArgList should be freed at this point.

      //Return a message to the console buffer.
      strcpy(ret, "\ntriggered event\n");
    }

    //Return the message to the console.
    return ret;
  }

  //Load Policy (load)
  //Invoked when 'load' is entered into the console, with respective parameters.
  //Loads a policy into the Finger2 Policy Repository. Upon invocation, outputs status information to the console.
  //Arguments:
  //1. Policy ID
  //2. Predicate ID.
  //3. Event ID.
  //4. Action ID.
  //5. Bitmap of pre/act argument descriptions. Generally unsed. See Finger2 documentation.
  //6. Bitmap of action argument descriptions. Generally unused. See Finger2 documentation.
  //7. Predicate argument 1.
  //8. Predicate argument 2.
  //Arguments 9 through 12 are action arguments.
  event char *FingerIICommand2.eval(int argc, char **argv) {
    OblPolicy_t* policy = (OblPolicy_t*) malloc(sizeof(OblPolicy_t));

    //Get a buffer to return output to the console. If no memory is available, don't run the command to prevent a crash.
    char *ret = call FingerIICommand2.getBuffer(20);
    if (ret != NULL) {
      //Serialize the arguments from argv into the OblPolicy_t struct.
      policy->policyId = (policy_t) atoi(argv[1]);
      policy->predicateId = (predicate_t) atoi(argv[2]);
      policy->eventId = (event_t) atoi(argv[3]);
      policy->actionId = (action_t) atoi(argv[4]);
      policy->preArgDesc = (uint8_t) atoi(argv[5]);     //< bitmap of pre/act args, whether the respective arg is reference to evt ctx or constant value
      policy->actArgDesc = (uint8_t) atoi(argv[6]);     //< NOTE: seems like waste of bits, but compiler's struct padding would reserve it anyway
      policy->predicateArgs[0] = (argument_t) atoi(argv[7]);
      policy->predicateArgs[1] = (argument_t) atoi(argv[8]);
      policy->actionArgs[0] = (argument_t) atoi(argv[9]);
      policy->actionArgs[1] = (argument_t) atoi(argv[10]);
      policy->actionArgs[2] = (argument_t) atoi(argv[11]);
      policy->actionArgs[3] = (argument_t) atoi(argv[12]);

      //Load the policy.
      call FingerIICommand2.write(call PolicyManagerI.LoadPolicy(policy), 128);

      //Return a message to the console buffer.
      strcpy(ret, "\nloaded\n");
    }

    //Return the message to the console.
    return ret;
  }

  //Remove Policy (remove)
  //Invoked when 'remove' is entered into the console, with respective parameters.
  //Removes specified policy from the Finger2 Policy Repository. Upon invocation, outputs status information to the console.
  //Arguments:
  //1. Policy ID.
  event char *FingerIICommand3.eval(int argc, char **argv) {
    //Get a buffer to return output to the console. If no memory is available, don't run the command to prevent a crash.
    char *ret = call FingerIICommand3.getBuffer(20);
    if (ret != NULL) {
      //Remove the policy.
      call FingerIICommand3.write(call PolicyManagerI.RemovePolicy((policy_t) atoi(argv[1])), 128);

      //Return a message to the console buffer.
      strcpy(ret, "\npolicy removed\n");
    }

    //Return the message to the console.
    return ret;
  }

  //Enable Policy (enable)
  //Invoked when 'enable' is entered into the console, with respective parameters.
  //Enables specified policy from the Finger2 Policy Repository. Upon invocation, outputs status information to the console.
  //Arguments:
  //1. Policy ID.
  event char *FingerIICommand4.eval(int argc, char **argv) {
    //Get a buffer to return output to the console. If no memory is available, don't run the command to prevent a crash.
    char *ret = call FingerIICommand4.getBuffer(20);
    if (ret != NULL) {
      //Enable the policy.
      call PolicyManagerI.EnablePolicy((policy_t) atoi(argv[1]), TRUE);

      //Return a message to the console buffer.
      strcpy(ret, "\npolicy enabled\n");
    }

    //Return the message to the console.
    return ret;
  }

  //Disable Policy (disable)
  //Invoked when 'disable' is entered into the console, with respective parameters.
  //Disables specified policy from the Finger2 Policy Repository. Upon invocation, outputs status information to the console.
  //Arguments:
  //1. Policy ID.
  event char *FingerIICommand5.eval(int argc, char **argv) {
    //Get a buffer to return output to the console. If no memory is available, don't run the command to prevent a crash.
    char *ret = call FingerIICommand5.getBuffer(20);
    if (ret != NULL) {
      //Disable the policy.
      call PolicyManagerI.EnablePolicy((policy_t) atoi(argv[1]), FALSE);

      //Return a message to the console buffer.
      strcpy(ret, "\npolicy disabled\n");
    }

    //Return the message to the console.
    return ret;
  }

}