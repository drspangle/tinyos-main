/**
 * Finger2 - Embedded Policy System for Sensor Networks
 *
 * Copyright (c) 2009-2010, Themistoklis Bourdenas
 * (http://www.doc.ic.ac.uk/~tbourden/)
 *
 * Finger2 is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Finger2 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Finger2.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "Common.h"
#include "Events.h"
#include "Predicates.h"
#include "Actions.h"
#include "Policies.h"


#ifndef TEST_H 
#define TEST_H

typedef nx_struct multihop_injection_msg {
  nx_uint16_t payload;
} multihop_injection_msg_t;

enum {
  AM_MULTIHOP_INJECTION_MSG = 1,
};

#endif

module DemoAppP
{
	uses
	{
		interface Boot;
		interface PolicyManagerI;
		interface SplitControl as AMControl; //nq
		
	} 
}

implementation
{

	event void Boot.booted()
	{
		// OblPolicy_t policy;
		OblPolicy_t* policy; //nq
	    dbg("core", "PolicyLoader: booting...loading policy for timer.fire event\n"); //nq
	    policy->policyId = 1; //nq
	    policy->predicateId = Pre_assoc_equal; //nq
	    policy->eventId = 6; //nq
	    policy->actionId = 1; //nq
	    policy->preArgDesc = 2; //nq control the order of argument and value in the Predicates. Example counter = 3 that 0 means the parameter value would be at the left side of the formula, 1 means parameter is at the right side of the formula   
	    policy->actArgDesc = 0; //nq same as preArgDesc (if needed)
	    policy->predicateArgs[0] = 3; //nq the first value of the predicate 
	    policy->predicateArgs[1] = 0; //nq the second value of the predicate
	    policy->predicateArgs[2] = 0; //nq the third value of the predicate
	    policy->actionArgs[0] = 1; //nq action first parameter (such as led number)
	    policy->actionArgs[1] = 0; //nq action second parameter (such as led number)
	    policy->actionArgs[2] = 0 ; //nq action third parameter (such as led number)
	    policy->actionArgs[3] = 0; //nq action forth parameter (such as led number)
	    call PolicyManagerI.LoadPolicy(policy); //nq
	    call AMControl.start(); //nq to test receiver
	    //-----------------------------------------------------------
	  //  dbg("core", "PolicyLoader: loding policy for event.done event...\n"); //nq
	    policy->policyId = 2; //nq
	    policy->predicateId = Pre_assoc_equal; //nq
	    policy->eventId = 6; //nq
	    policy->actionId = 1; //nq
	    policy->preArgDesc = 2; //nq control the order of argument and value in the Predicates. Example counter = 3 that 0 means the parameter value would be at the left side of the formula, 1 means parameter is at the right side of the formula   
	    policy->actArgDesc = 0; //nq same as preArgDesc (if needed)
	    policy->predicateArgs[0] = 3; //nq the first value of the predicate 
	    policy->predicateArgs[1] = 0; //nq the second value of the predicate
	    policy->predicateArgs[2] = 0; //nq the third value of the predicate
	    policy->actionArgs[0] = 2; //nq action first parameter (such as led number)
	    policy->actionArgs[1] = 0; //nq action second parameter (such as led number)
	    policy->actionArgs[2] = 0 ; //nq action third parameter (such as led number)
	    policy->actionArgs[3] = 0; //nq action forth parameter (such as led number)
	 //   call PolicyManagerI.LoadPolicy(policy); //nq
		//--	dbg("configurations", "PolicyLoader: booting...\n");
		

}
event void AMControl.startDone(error_t err) { //NQ I added this event
    if (err == SUCCESS) {  dbg("core","DemoApp-AMControl started\n");  }
    else { 
    	dbg("core","DemoApp Failed error number=%d\n",err);
      call AMControl.start();
    }
  }

  event void AMControl.stopDone(error_t err) { //NQ I added this event
    // do nothing
  }
 
}
