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
#include "Policy.h"

#include <string.h>

module PolicyRepositoryP
{
	provides
	{
		interface PolicyAccessI;
		interface PolicyManagerI;	
	}

	uses
	{
		interface Leds;
	}
}

implementation
{
	PolicyEntry_t policies[POLICY_STORAGE_CAPACITY];

	//--------------------------------------------------------------

	OblPolicy_t* GetPolicy(policy_t pid)
	{
		int i=0;
		for (; i < POLICY_STORAGE_CAPACITY; ++i)
			if (policies[i].policy.policyId == pid)
				return &policies[i].policy;
		return NULL;
	}

	//--------------------------------------------------------------

	PolicyEntry_t* GetPolicyEntry(OblPolicy_t* policy)
	{
		/*int i=0;
		for (; i < POLICY_STORAGE_CAPACITY; ++i)
			if (policy == &policies[i].policy)
				return &policies[i];*/

		///< NOTE: typecast works as the OblPolicy is at the beginning of the PolicyEntry struct
		return (PolicyEntry_t*)policy;
	}

	//--------------------------------------------------------------

	command char* PolicyManagerI.LoadPolicy(OblPolicy_t* policy)
		///< TODO: maybe I want to transform this into a task  
	{
		char* message = malloc(128);
		
		OblPolicy_t* slot;

		int i=0;
		for (; i < 128; ++i)
			message[i] = '\0';

		if ((slot = GetPolicy(NULL_POLICY)) == NULL)
			return message;

		memcpy(slot, policy, sizeof(OblPolicy_t));
		GetPolicyEntry(slot)->enabled = TRUE;
		//dbg("core", "PolicyRepositoryP:Load Policy -- pid: %d, evt: %d, enabled: %d\n", policy->policyId, policy->eventId, GetPolicyEntry(slot)->enabled); //nq
		
   		sprintf(message,"PolicyRepositoryP:Load Policy -- pid: %u, evt: %u, enabled: %u\n", policy->policyId, policy->eventId, GetPolicyEntry(slot)->enabled);

		return message;
	}

	//--------------------------------------------------------------

	command char* PolicyManagerI.RemovePolicy(policy_t pid)
		///< TODO: maybe I want to transform this into a task  
	{
		OblPolicy_t* policy;

		char* message = malloc(128);

		int i=0;
		for (; i < 128; ++i)
			message[i] = '\0';

		
		//int i=0; //nq
		//for (; i < POLICY_STORAGE_CAPACITY; ++i)//nq
		//	dbg("core", "PolicyRepositoryP:Remove Policy -- policy list befor deletion pid: %d\n", policies[i].policy.policyId); //nq
		if ((policy = GetPolicy(pid)) != NULL)
			policy->policyId = NULL_POLICY;
		//dbg("core", "PolicyRepositoryP:Remove Policy -- pid: %d\n", pid); //nq
		//i=0;
		//for (; i < POLICY_STORAGE_CAPACITY; ++i)//nq
		//	dbg("core", "PolicyRepositoryP:Remove Policy -- policy list after deletion pid: %d\n", policies[i].policy.policyId); //nq
		

		sprintf(message,"PolicyRepositoryP:Remove Policy -- pid: %u\n", pid);
		return message;
	}

	//--------------------------------------------------------------

	command void PolicyManagerI.EnablePolicy(policy_t pid, bool enable)
		///< TODO: maybe I want to transform this into a task  
	{
		OblPolicy_t* policy;
		if ((policy = GetPolicy(pid)) != NULL)
			GetPolicyEntry(policy)->enabled = enable;
	}
        
	//--------------------------------------------------------------

	command OblPolicy_t* PolicyAccessI.GetPolicyById(policy_t pid)
	{
		return GetPolicy(pid);
	}

	//--------------------------------------------------------------

	command void PolicyAccessI.GetPoliciesByEvent(event_t eid, argument_t* args)
		///< TODO: maybe I want to transform this into a task  
	{
		int i=0;
		//call Leds.led1Toggle();
		dbg("core", "PolicyRepositoryP:PolicyAccessI: GetPoliciesByEvent(%d)\n", eid); //nq
		for (; i < POLICY_STORAGE_CAPACITY; ++i) {
			//dbg("core", "policy[%d] -- pid: %d, evt: %d, enabled: %d\n", i, policies[i].policy.policyId, policies[i].policy.eventId, policies[i].enabled); //nq
			if (policies[i].enabled &&
				policies[i].policy.policyId != NULL_POLICY &&
				policies[i].policy.eventId == eid
			)
				{signal PolicyAccessI.PolicyRetrieved(&policies[i].policy, args);
				}
		}
	}

	//--------------------------------------------------------------
}
