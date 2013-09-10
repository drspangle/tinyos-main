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

#ifndef REQUEST_MSG_H
#define REQUEST_MSG_H

#include "Common.h"
#include "Policy.h"
#include "EventContext.h"

typedef enum {
	AM_VARIANCEUPDATEMSG = 0x92,
	AM_NETWORKMSG = 0x88, AM_SERIALMSG = 0x89,
	AM_REQUEST_MSG = 0x28, AM_RESPONSEMSG = 0x29,
} message_id_t;

//--------------------------------------------------------------

typedef struct VarianceUpdateMsg
{
	uint16_t sensor;
	float variance;
} VarianceUpdateMsg_t;

//--------------------------------------------------------------

typedef nx_struct NetworkMsg
{
	nx_uint16_t data[NACTARGS];
} NetworkMsg_t;

//--------------------------------------------------------------

typedef nx_struct SerialMsg
{
	nx_uint16_t data[NACTARGS];
} SerialMsg_t;

//--------------------------------------------------------------

typedef enum {
	LOAD_POLICY, REMOVE_POLICY, ENABLE_POLICY, DISABLE_POLICY,
	GET_POLICY,
	TRIGGER_EVENT,
} request_enum_t;
typedef uint8_t request_t;

//--------------------------------------------------------------

typedef struct RequestMsg
{
	role_t source;
	role_t target;
	request_t request;
	uint8_t seq;

	union
	{
		policy_t policyId;
		OblPolicy_t oblPolicy;
		EventContext_t evt;
	} context;
} RequestMsg_t;

//--------------------------------------------------------------

typedef struct ResponseMsg
{
	uint8_t seq;
} ResponseMsg_t;

//--------------------------------------------------------------

#endif /* REQUEST_MSG_H */
