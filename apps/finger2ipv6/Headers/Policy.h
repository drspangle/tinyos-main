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

#ifndef POLICY_H
#define POLICY_H

#include "Common.h"

typedef struct OblPolicy
{
	policy_t policyId;
	predicate_t predicateId;
	event_t eventId;
	action_t actionId;
 	uint8_t preArgDesc;			//< bitmap of pre/act args, whether the respective arg is reference to evt ctx or constant value
	uint8_t actArgDesc;			//< NOTE: seems like waste of bits, but compiler's struct padding would reserve it anyway
	argument_t predicateArgs[NPREARGS];
	argument_t actionArgs[NACTARGS];
} OblPolicy_t;						///< NOTE: total size == 20 bytes

/*typedef struct PolicyIterator
{
	OblPolicy_t policy;
	int8_t next;		///< single linked list over a fixed-size array (policies with same eventId)
} PolicyIterator_t;*/

typedef struct PolicyEntry
{
	OblPolicy_t policy;
	bool enabled;
} PolicyEntry_t;

#endif /* POLICY_H */
