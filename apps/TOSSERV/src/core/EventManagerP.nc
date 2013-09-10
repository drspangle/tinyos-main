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

module EventManagerP
{
	provides
	{
		interface EventSourceI as Events;
	}

	uses
	{
		interface Leds;
		interface EventSourceI as ExternEvt;
		interface EventSourceI as InternEvt[event_t];	///< Dispatcher design pattern
	}
}

implementation
{
	event void ExternEvt.evt(event_t eid, argument_t* args)
	{
		dbg("core", "EventManagerP: ExternEvt::evt(%d, %d)\n", eid, args[0]);
		//call Leds.led2Toggle();
		signal Events.evt(eid, args);
	}

	//--------------------------------------------------------------

	event void InternEvt.evt[event_t](event_t eid, argument_t* args)
	{
		dbg("core", "EventManagerP: InternEvt::evt(eid:%d, args:%d,%d,%d)\n", eid, args[0],args[1],args[2]); //nq
		// call Leds.led1Toggle();   
		signal Events.evt(eid, args);   
	}

	//--------------------------------------------------------------
}
