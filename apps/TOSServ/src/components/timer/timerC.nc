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

configuration timerC
{
	provides
	{
#define DONT_EDIT_HERE
		interface EventSourceI as Off;
		interface ActionI as OneShot;
		interface ActionI as Periodic;
#undef DONT_EDIT_HERE
	}
}

implementation
{
	components
		new TimerMilliC() as MilliSecTimer,
		MainC, LedsC,
		timerP; 
		
 
	//-- Do internal wiring of action modules
	timerP.Boot -> MainC;
	timerP.EvtTimer -> MilliSecTimer;
 	 
	//-- Forward EvenSourceI & ActionI interfaces
	Off = timerP.Off;
	OneShot = timerP.OneShot;
	Periodic = timerP.Periodic;
}
