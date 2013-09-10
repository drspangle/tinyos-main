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

#ifndef FINGER2SRCHEADERSPREDICATESH
#define FINGER2SRCHEADERSPREDICATESH

enum { Pre_arith_add = 1, Pre_arith_sub = 2, Pre_arith_mul = 3, Pre_arith_div = 4, Pre_network_IsAvail = 5, Pre_mission_IsActive = 6, Pre_assoc_equal = 7, Pre_assoc_notequal = 8, Pre_assoc_lessequal = 9, Pre_assoc_less = 10, Pre_assoc_moreequal = 11, Pre_assoc_more = 12, Pre_assoc_always = 13, Pre_assoc_never = 14, Pre_logic_and = 15, Pre_logic_or = 16, Pre_logic_not = 17, Pre_sensor_IsOk = 18, Pre_math_abs = 19 };

#endif //FINGER2SRCHEADERSPREDICATESH
