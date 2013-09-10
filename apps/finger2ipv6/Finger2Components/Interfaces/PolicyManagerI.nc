/*
* Finger2IPv6 - UDP Console Based IPv6 Policy System
* Created by Daniel Smullen
* Please report bugs to: Daniel.Smullen@uoit.net
*
* Based on Finger2 - Embedded Policy System for Sensor Networks
* Created by Themistoklis Bourdenas, modified by Nidal Qwasmi
*
* Finger2IPv6 is free software: you can redistribute it and/or modify
* it under the terms of the GNU Lesser General Public License as published
* by the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Finger2IPv6 is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
* along with Finger2.  If not, see <http://www.gnu.org/licenses/>.
*/



#include "Common.h"
#include "Policy.h"

interface PolicyManagerI
{
	//This interface was modified from the standard Finger2 in order
	//to support messages being returned from policy commands to the UDP console.
	command char* LoadPolicy(OblPolicy_t* policy);
	command char* RemovePolicy(policy_t pid);
	command void EnablePolicy(policy_t pid, bool enable);
}
