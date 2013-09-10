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

#ifndef FINGER2SRCHEADERSACTIONSH
#define FINGER2SRCHEADERSACTIONSH

enum { Act_led_Toggle = 1, Act_network_BCast = 2, Act_network_Send = 3, Act_power_Level = 4, Act_buffer_Create = 5, Act_buffer_Add = 6, Act_buffer_Get = 7, Act_fault_detect = 8, Act_feature_Avg = 9, Act_feature_Median = 10, Act_feature_Variance = 11, Act_feature_CorrCoef = 12, Act_timer_OneShot = 13, Act_timer_Periodic = 14, Act_mission_Install = 15, Act_mission_Remove = 16, Act_role_Install = 17, Act_sensor_Sense = 18, Act_sensor_Get = 19 };

#endif //FINGER2SRCHEADERSACTIONSH
