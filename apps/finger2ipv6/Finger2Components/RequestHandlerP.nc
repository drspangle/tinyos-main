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

 //*************************************************
 //THIS FILE IS NO LONGER USED AND IS DEPRECATED IN Finger2IPv6.
 //*************************************************

#include "Common.h"
#include "Messages.h"

module RequestHandlerP
{
	provides
	{
		interface EventSourceI;
		
	}
	uses
	{
		interface PolicyManagerI;
		//interface DispatchCommand;

		//Old code////////////////////////////
		interface Receive as RequestReceiver;
		//interface Packet; //nq
		//interface AMPacket; //nq
		//////////////////////////////////////
	}
}

implementation
{

//Old code////////////////////////////

	//event message_t* RequestReceiver.dispatch(int command, argument_t* args)
	//event void DispatchCommand.dispatch(int argc, char **argv);
	event message_t* RequestReceiver.receive(message_t* msg, void* payload, uint8_t len)
	{
		 RequestMsg_t* request = (RequestMsg_t*)payload;
		 //dbg("core", "RequestHandler: Pkt recieved Pkt: source=%d, target=%d, request=%d.\n", request->source, request->target, request->request); //nq
		 //dbg("core","RequestHandler: Pkt: args=%d : predict ID=%d\n", request->context.evt.args[0],request->context.oblPolicy.predicateId);

		//if (request->target != TOS_NODE_ID)
		//	return msg;
		
		if (request->request == TRIGGER_EVENT)
			signal EventSourceI.evt(request->context.evt.eventId, request->context.evt.args);
		else if (request->request == LOAD_POLICY)
			call PolicyManagerI.LoadPolicy(&request->context.oblPolicy);
		else if (request->request == REMOVE_POLICY)
			call PolicyManagerI.RemovePolicy(request->context.policyId);
		else if (request->request == ENABLE_POLICY)
			call PolicyManagerI.EnablePolicy(request->context.policyId, TRUE);
		else if (request->request == DISABLE_POLICY)
			call PolicyManagerI.EnablePolicy(request->context.policyId, FALSE);
		return msg;
		
	}
}