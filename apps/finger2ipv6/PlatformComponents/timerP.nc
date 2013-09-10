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

module timerP
{
	provides
	{
		interface EventSourceI as Off;
		interface ActionI as OneShot;
		interface ActionI as Periodic;
	}

	uses
	{
		interface Boot;
		interface Timer<TMilli> as EvtTimer;
		
	}
}

implementation
{
	enum { TIMER_PERIOD = 1000, };

	uint16_t count=0;

	//--------------------------------------------------------------

	event void Boot.booted()
	{
		dbg("core","timer:Boot.booted: call EvtTimer.startPeriodic(TIMER_PERIOD)\n");
		call EvtTimer.startPeriodic(TIMER_PERIOD);
		
	}

	//--------------------------------------------------------------

	event void EvtTimer.fired()
	{
		dbg("core","timer:EvtTimer.fired:signal Off.evt\n");
		signal Off.evt(Evt_Timer_Off, &count);
		// dbg("core","timer:EvtTimer.fired event.done Off.evt\n");
		// signal Off.evt(Evt_boot_Done,&count); // NQ I added this line to see if I can trigger another policy
		count= ++count; // nq I added it to control policy execution
	}

	//--------------------------------------------------------------

	command void OneShot.perform(argument_t* args)
	{
		call EvtTimer.startPeriodic(TIMER_PERIOD);
		count = args[TIMER_PERIOD / args[1]];	
	}

	//--------------------------------------------------------------

	command void Periodic.perform(argument_t* args)
	{
		call EvtTimer.startPeriodic(TIMER_PERIOD);
		count = args[TIMER_PERIOD / args[1]];
	}

	//--------------------------------------------------------------
}