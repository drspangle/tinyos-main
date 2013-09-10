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

module PredicateRepositoryP
{
	provides interface PredicateAccessI;

	uses interface PredicateI as Predicates[predicate_t];		///< Dispatcher design pattern
	
}

implementation
{
	default command bool Predicates.evaluate[predicate_t id](argument_t* args)
	{
		dbg("core", "PredicateRepositoryP: Predicates.evaluate (default)(%d)\n", id); //nq
		///< default function for Predicate ids that dont have a match in the dispatcher
		 return FALSE;  
	}

	command bool PredicateAccessI.Evaluate(predicate_t predicateId, argument_t* args)
	{
		// NQ I  created this module 
		dbg("core", "PredicateRepositoryP: PredicateAccessI.Evaluate(%d, args[0]=%d, args[1]=%d, args[2]= %d)\n", predicateId, args[0], args[1],args[2]); //nq
		switch (predicateId) 
		{
			case 1:  //Pre_arith_add = 1
				
			case 2: //Pre_arith_sub = 2,
				
			case 3:  //Pre_arith_mul = 3
			
			case 4:  //Pre_arith_div = 4
				
			case 5: //Pre_network_IsAvail = 5
				
			case 6:  //Pre_mission_IsActive = 6
			
			case 7:  // Pre_assoc_equal = 7
				return (args[0] == args[1]) ? TRUE: FALSE;
			case 8: // Pre_assoc_notequal = 8
					 
				return (args[0] != args[1]) ? TRUE: FALSE;			
			case 9:  //  Pre_assoc_lessequal = 9
				return (args[0] <= args[1]) ? TRUE: FALSE;
			case 10:  //  Pre_assoc_less = 10
				return (args[0] < args[1]) ? TRUE: FALSE;
			case 11: //  Pre_assoc_moreequal = 11
					 
				return (args[0] >= args[1]) ? TRUE: FALSE;				
			case 12:  // Pre_assoc_more = 12
				return (args[0] > args[1]) ? TRUE: FALSE;
			case 13: // Pre_assoc_always = 13
				return TRUE;
			case 14:  // Pre_assoc_never = 14
				return FALSE;					
			case 15:  // Pre_logic_and = 15
				return (args[0] & args[1]) ? TRUE: FALSE;
			case 16: // Pre_logic_or = 16
				return (args[0] | args[1]) ? TRUE: FALSE;
			case 17: // Pre_logic_not = 17	
				return (~args[0]) ? TRUE: FALSE;
			case 18: // Pre_sensor_IsOk = 18
			
			case 19: // Pre_math_abs = 19	
					
			default: return call Predicates.evaluate[predicateId](args);
		}
		
	}
}
