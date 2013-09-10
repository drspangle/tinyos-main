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

module assocP
{
	provides
	{
		interface PredicateI as equal;
		interface PredicateI as notequal;
		interface PredicateI as lessequal;
		interface PredicateI as less;
		interface PredicateI as moreequal;
		interface PredicateI as more;
		interface PredicateI as always;
		interface PredicateI as never;
	}
}

implementation
{
	command bool equal.evaluate(argument_t* args)
	{
		return args[0] == args[1];
	}

	//--------------------------------------------------------------

	command bool notequal.evaluate(argument_t* args)
	{
		return args[0] != args[1];
	}

	//--------------------------------------------------------------

	command bool lessequal.evaluate(argument_t* args)
	{
		return args[0] <= args[1];
	}

	//--------------------------------------------------------------

	command bool less.evaluate(argument_t* args)
	{
		return args[0] < args[1];
	}

	//--------------------------------------------------------------

	command bool moreequal.evaluate(argument_t* args)
	{
		return args[0] >= args[1];
	}

	//--------------------------------------------------------------

	command bool more.evaluate(argument_t* args)
	{
		return args[0] > args[1];
	}

	//--------------------------------------------------------------

	command bool always.evaluate(argument_t* args)
	{
		return TRUE;
	}

	//--------------------------------------------------------------

	command bool never.evaluate(argument_t* args)
	{
		return FALSE;
	}

	//--------------------------------------------------------------
}
