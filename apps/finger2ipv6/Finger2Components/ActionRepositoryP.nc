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

module ActionRepositoryP
{
	provides interface ActionAccessI;

	uses interface ActionI as Actions[action_t];		///< Dispatcher design pattern
	
}

implementation
{
	
	default command void Actions.perform[action_t id](argument_t* args)
	{
		///< default function for action ids that dont have a match in the dispatcher
		
	}

	//--------------------------------------------------------------

	command void ActionAccessI.Trigger(action_t actionId, argument_t* args)
	{
		// NQ I  created this module 
		
		dbg("core", "ActionRepositoryP.Trigger(%d, args[0]=%d, args[1]=%d, args[2]= %d)\n", actionId, args[0],args[1],args[2]); //nq
		switch (actionId) 
		{
			case 1:  //Act_led_Toggle = 1
 				call Actions.perform[actionId](args);
 				dbg("core", "ActionRepositoryP.Trigger-case #1 (Act_led_Toggle) with led Number %d\n",args[0]);
  				break;
			case 2: //Act_network_BCast = 2
				
			case 3:  //Act_network_Send = 3
			
			case 4:  //Act_power_Level = 4
				
			case 5: //Act_buffer_Create = 5
				
			case 6:  //Act_buffer_Add = 6
			
			case 7:  //Act_buffer_Get = 7
					 
			case 8: //Act_fault_detect = 8
				
			case 9:  //Act_feature_Avg = 9
			
			case 10: //Act_feature_Median = 10
				
			case 11: //Act_feature_Variance = 11
				
			case 12: //Act_feature_CorrCoef = 12
			
			case 13: //Act_timer_OneShot = 13
				
			case 14:  //Act_timer_Periodic = 14
			
			case 15: //Act_mission_Install = 15
				
			case 16: //Act_mission_Remove = 16
				
			case 17: //Act_role_Install = 17	
			
			case 18: //Act_sensor_Sense = 18
			
			case 19: //Act_sensor_Get = 19	
					
			default: call Actions.perform[actionId](args);
		
		}
	}

	//--------------------------------------------------------------
}
