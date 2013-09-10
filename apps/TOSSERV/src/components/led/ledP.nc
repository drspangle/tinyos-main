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

module ledP
{
	provides
	{
		interface ActionI as Toggle;
	}

	uses interface Leds;
}

implementation
{
	command void Toggle.perform(argument_t* args)
	{
		//dbg("actions", "led.Toggle action performed (ctx::[%d, %d, %d])\n", args[0], args[1], args[2]);
		dbg("core", "led.Toggle action performed (ctx:[%d, %d, %d])\n", args[0], args[1], args[2]); //nq
		switch (args[0])
		{
			case 0: call Leds.led0Toggle();
				break;
			case 1: call Leds.led1Toggle();
				break;
			case 2: call Leds.led2Toggle();
				break;
			default: call Leds.led2Toggle();
				break;
		}
	}

	//--------------------------------------------------------------
}
