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

configuration assocC
{
	provides
	{
#define DONT_EDIT_HERE
		interface PredicateI as equal;
		interface PredicateI as notequal;
		interface PredicateI as lessequal;
		interface PredicateI as less;
		interface PredicateI as moreequal;
		interface PredicateI as more;
		interface PredicateI as always;
		interface PredicateI as never;
#undef DONT_EDIT_HERE
	}
}

implementation
{
	components assocP;

	//-- Forward package interfaces
	equal = assocP.equal;
	notequal = assocP.notequal;
	lessequal = assocP.lessequal;
	less = assocP.less;
	moreequal = assocP.moreequal;
	more = assocP.more;
	always = assocP.always;
	never = assocP.never;

	//-- TODO: do internal lower-level wiring of modules
}
