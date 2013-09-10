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

#ifndef COMMON_H
#define COMMON_H

#define NEVTARGS 2
#define NPREARGS 3
#define NACTARGS 4

typedef uint8_t role_t;
typedef uint8_t policy_t;
typedef uint8_t event_t;
typedef uint8_t predicate_t;
typedef uint8_t action_t;
typedef uint16_t argument_t;

typedef enum { OP_NEVER, OP_ALWAYS, OP_LESS, OP_MORE, OP_EQ, OP_NE, } operator_enum_t;
typedef uint8_t operator_t;

enum { POLICY_STORAGE_CAPACITY = 32, NULL_POLICY = 0, };

#endif /* COMMON_H */
