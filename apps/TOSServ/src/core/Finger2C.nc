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
#include "Messages.h"

configuration Finger2C
{
	uses
	{
		interface EventSourceI as Events[event_t];
		interface PredicateI as Predicates[predicate_t];
		interface ActionI as Actions[action_t];
	}
}

implementation
{
	components
		new AMReceiverC(AM_REQUEST_MSG) as RequestReceiver,
		// MockAMReceiver,

		MainC, LedsC,

		RequestHandlerP,
		EventManagerP,
		ObligationManagerP,

		PolicyRepositoryP,
		PredicateRepositoryP,
		ActionRepositoryP
		;

	//MockAMReceiver.Boot -> MainC;
	//RequestHandlerP.RequestReceiver -> MockAMReceiver;
	RequestHandlerP.RequestReceiver -> RequestReceiver;
	RequestHandlerP.PolicyManagerI -> PolicyRepositoryP;

	EventManagerP.ExternEvt -> RequestHandlerP.EventSourceI;
	EventManagerP.Leds -> LedsC;

	PolicyRepositoryP.Leds -> LedsC;

	ObligationManagerP.Leds -> LedsC;
	ObligationManagerP.PolicyAccessI -> PolicyRepositoryP;
	ObligationManagerP.EventSourceI -> EventManagerP.Events;
	ObligationManagerP.PredicateAccessI -> PredicateRepositoryP;
	ObligationManagerP.ActionAccessI -> ActionRepositoryP;

	Events = EventManagerP.InternEvt;
	Predicates = PredicateRepositoryP.Predicates;
	Actions = ActionRepositoryP.Actions; 
}
