/* Locks
 * Author: Franklin
 * Creation date: 26/10/2020
 */
MACHINE           Locks

INCLUDES          Doors

PROMOTES          closedoor

SETS              STATUS = { locked , unlocked }

ABSTRACT_VARIABLES status

INVARIANT         status : DOOR --> STATUS
                  & position ~ [ { open } ] <: status ~ [ { unlocked } ]

INITIALISATION    status := DOOR * { locked }

OPERATIONS

opendoor ( dd ) =
  PRE dd : DOOR & status ( dd ) = unlocked
  THEN opening ( dd )
  END ;

unlockdoor ( dd ) =
  PRE dd : DOOR & position ( dd ) = closed
  THEN status ( dd ) := unlocked
  END ;

lockdoor ( dd ) =
  PRE dd : DOOR & position ( dd ) = closed
  THEN status ( dd ) := locked
  END ;

quickclose ( dd ) =
  PRE dd : DOOR & position ( dd ) = open
  THEN status ( dd ) := locked || closedoor ( dd )
  END

END
