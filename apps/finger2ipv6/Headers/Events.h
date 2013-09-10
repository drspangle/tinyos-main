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

#ifndef FINGER2SRCHEADERSEVENTSH
#define FINGER2SRCHEADERSEVENTSH

enum { Evt_network_Receive = 1, Evt_buffer_Full = 2, Evt_fault_TrendDrifting = 3, Evt_fault_CorrDrifting = 4, Evt_boot_Done = 5, Evt_Timer_Off = 6, Evt_mission_Installed = 7, Evt_mission_Removed = 8, Evt_policy_Installed = 9, Evt_policy_Removed = 10, Evt_role_Assigned = 11, Evt_serial_Receive = 12, Evt_sensor_Reading = 13 };

#endif //FINGER2SRCHEADERSEVENTSH
