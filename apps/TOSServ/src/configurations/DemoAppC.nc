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
/** arithC, 
		networkC, 
		powerC, 
		faultC, 
		vitalsC, 
		featureC,  
		missionC, 
		rolC,  
		serialC, 
		alertC, 
		mathC,
*/
#include "Common.h"
#include "Events.h"
#include "Predicates.h"
#include "Actions.h"
#include "Messages.h"


configuration DemoAppC
{
}

implementation
{
	components
	    new AMReceiverC(AM_REQUEST_MSG) as RequestReceiver, // nq add it 
		RequestHandlerP,
		ActiveMessageC, //NQ add to test receive
		MainC, 
		PolicyRepositoryP, 
		DemoAppP,
		timerC,
		ObligationManagerP, //-- NQ
		PredicateRepositoryP, //-- NQ
		ActionRepositoryP, //-- NQ 
		EventManagerP, //-- NQ
		ledC; //NQ 

	DemoAppP.Boot -> MainC;
	DemoAppP.PolicyManagerI -> PolicyRepositoryP; //NQ
	/// testing the packet injection
	DemoAppP.AMControl -> ActiveMessageC; //nq to test receiver
	//DemoAppP.Packet -> RequestReceiver;
	//DemoAppP.AMPacket -> RequestReceiver;

	///// 
	RequestHandlerP.Packet -> RequestReceiver;
	RequestHandlerP.AMPacket -> RequestReceiver;
	RequestHandlerP.RequestReceiver -> RequestReceiver; //NQ
	RequestHandlerP.PolicyManagerI -> PolicyRepositoryP; //NQ
	EventManagerP.ExternEvt -> RequestHandlerP.EventSourceI; //NQ

	//-- Event wirings
	 
    EventManagerP.InternEvt[Evt_Timer_Off] -> timerC.Off; //-- NQ 
    ObligationManagerP.EventSourceI -> EventManagerP.Events; //NQ
	ObligationManagerP.ActionAccessI -> ActionRepositoryP; //NQ
	ObligationManagerP.PolicyAccessI -> PolicyRepositoryP; //NQ
    //EventManagerP.Leds -> LedsC;
    
	//-- Predicate wirings
	ObligationManagerP.PredicateAccessI -> PredicateRepositoryP; //NQ
	

	//-- Action wirings
	ActionRepositoryP.Actions[Act_led_Toggle] -> ledC; //NQ
	
	
}
