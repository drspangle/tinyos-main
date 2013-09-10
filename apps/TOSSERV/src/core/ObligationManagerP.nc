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

module ObligationManagerP
{
	uses
	{
		interface Leds;
		
		interface EventSourceI;

		interface PolicyAccessI;
		interface PredicateAccessI;
		interface ActionAccessI;
	}
}

implementation
{
	argument_t* NormaliseArgs(argument_t* out, argument_t* in, argument_t* ctx, uint8_t descr, uint8_t nArgs)
	{
		uint8_t mask=0x1, i=0;
		for (; i < nArgs; ++i, mask <<= 1)
			{
			out[i] = (descr & mask) ? ctx[in[i]] : in[i];
			dbg("core", "ObligationManagerP: NormaliseArgs: out[%d]=%d:desc=%d,mask=%d,ctx[in[i]]=%d,in[i]=%d\n",i,out[i],descr,mask,ctx[in[i]],in[i]);	//nq
			}
		return out;
	}

	//--------------------------------------------------------------

	event void EventSourceI.evt(event_t eid, argument_t* args)
	{
		dbg("core", "ObligationManagerP: EventSourceI::evt(eid:%d,args[0]:%d,args[1]:%d,args[2]:%d)\n", eid, args[0],args[1],args[2]);
		//call Leds.led1Toggle();
		call PolicyAccessI.GetPoliciesByEvent(eid, args);
	}

	//--------------------------------------------------------------

	event void PolicyAccessI.PolicyRetrieved(OblPolicy_t* policy, argument_t* args)
	{
		argument_t buf[4];

		//call Leds.led1Toggle();
		dbg("core", "ObligationManagerP: PolicyAccessI::PolicyRetrieved(policyID:%d, predicateArgs:%d)\n", policy->policyId, policy->predicateArgs[0]);	//nq
		//-- evaluate condition and activate attached action
		if (call PredicateAccessI.Evaluate(policy->predicateId, NormaliseArgs(buf, policy->predicateArgs, args, policy->preArgDesc, NPREARGS)))
			call ActionAccessI.Trigger(policy->actionId, NormaliseArgs(buf, policy->actionArgs, args, policy->actArgDesc, NACTARGS));
	}
	//--------------------------------------------------------------
}
