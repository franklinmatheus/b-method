/* Doors
 * Author: Franklin
 * Creation date: 26/10/2020
 */
MACHINE           Doors

SETS              DOOR ; POSITION = { open , closed }

ABSTRACT_VARIABLES position

INVARIANT         position : DOOR --> POSITION

INITIALISATION    position := DOOR * { closed }

OPERATIONS

  opening ( dd ) =
  PRE dd : DOOR THEN position ( dd ) := open END ;

  closedoor ( dd ) =
  PRE dd : DOOR THEN position ( dd ) := closed END

END
