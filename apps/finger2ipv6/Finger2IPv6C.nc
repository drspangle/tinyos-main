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
#include "Predicates.h"
#include "Actions.h"
#include "Messages.h"

//Include the IPv6 and 6LoWPAN Headers
#include <lib6lowpan/6lowpan.h>

//Module configuration for Finger2IPv6. This configuration connects the wirings between the components
//used by Finger2IPv6. It also includes wirings for components which support policy programming.
//In this instance, custom LED and Timer components have been wired in for testing.
configuration Finger2IPv6C
{
}

implementation
{
	//Requires the blip IPv6 stack.
  	components IPStackC;

  	//Radio control is handed over to the blip stack.
	Finger2IPv6P.RadioControl ->  IPStackC;

	components
		//Requires Finger2 Request Handler component.
		RequestHandlerP,

		MainC, 

		//Requires Finger2 Policy Repository
		PolicyRepositoryP,

		//Link to main program entry point. 
		Finger2IPv6P,

		//A custom timer platform component implmentation is used for policy testing.
		timerC,

		//Requires the Finger2 Obligation Manager, Predicate Repository, Action Repository, and Event Manager.
		ObligationManagerP, //-- NQ
		PredicateRepositoryP, //-- NQ
		ActionRepositoryP, //-- NQ 
		EventManagerP, //-- NQ

		//A custom LED platform component implmentation is used for policy testing.
		ledC; //NQ 

	//Requires RPL routing, and the UDP Shell component provided by blip.
	components RPLRoutingC,UDPShellC;
	
	//Create the new shell commands for interacting with Finger2.
	components new ShellCommandC("f2help")  as FingerIICommand0;
	components new ShellCommandC("trigger") as FingerIICommand1;
	components new ShellCommandC("load")    as FingerIICommand2;
	components new ShellCommandC("remove")  as FingerIICommand3;
	components new ShellCommandC("enable")  as FingerIICommand4;
	components new ShellCommandC("disable") as FingerIICommand5;

	//Connect this component's boot event to the main execution stack.
	Finger2IPv6P.Boot -> MainC;

	//The Finger2 Policy manager is connected to the policy repository.
	Finger2IPv6P.PolicyManagerI -> PolicyRepositoryP; //NQ

	//Enable the new shell commands by connecting them with their events.
	Finger2IPv6P.FingerIICommand0 -> FingerIICommand0;
	Finger2IPv6P.FingerIICommand1 -> FingerIICommand1;
	Finger2IPv6P.FingerIICommand2 -> FingerIICommand2;
	Finger2IPv6P.FingerIICommand3 -> FingerIICommand3;
	Finger2IPv6P.FingerIICommand4 -> FingerIICommand4;
	Finger2IPv6P.FingerIICommand5 -> FingerIICommand5;

	//Events can be invoked by wiring the EventManager to the EventSource interface.
	EventManagerP.ExternEvt -> Finger2IPv6P.EventSourceI; 		//NQ

	//Event Wirings for test policy events.
    EventManagerP.InternEvt[Evt_Timer_Off] -> timerC.Off; 		//NQ 
    ObligationManagerP.EventSourceI -> EventManagerP.Events; 	//NQ
	ObligationManagerP.ActionAccessI -> ActionRepositoryP; 		//NQ
	ObligationManagerP.PolicyAccessI -> PolicyRepositoryP; 		//NQ
    //EventManagerP.Leds -> LedsC;
    
	//Predicate Wirings
	ObligationManagerP.PredicateAccessI -> PredicateRepositoryP;//NQ
	
	//Action Wirings
	ActionRepositoryP.Actions[Act_led_Toggle] -> ledC; 			//NQ
}
