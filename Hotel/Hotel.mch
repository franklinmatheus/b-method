/* Hotel
 * Author: Franklin
 * Creation date: 30/09/2020
 */
MACHINE 
    Hotel

CONSTANTS         
    small, sze

SETS 
    ROOM

PROPERTIES        
    sze : NATURAL1 & card(ROOM) = sze & small <: ROOM

VARIABLES         
    numbers

INVARIANT         
    numbers : ROOM --> 0..6 & numbers[small] <: 0..4

INITIALISATION    
    numbers := ROOM * {0}

OPERATIONS

  checkin(rr,nn) =
  PRE rr : ROOM & nn : 1..6 & numbers(rr) = 0 & (rr : small => nn <= 4)
  THEN numbers(rr) := nn
  END;

  checkout(rr) = 
  PRE rr : ROOM
  THEN numbers(rr) := 0 
  END;

nn <-- roomquery(rr) = 
  PRE rr : ROOM
  THEN nn := numbers(rr) 
  END;

nn <-- vacancies = nn := card(numbers |> {0});

nn <-- totalguests = nn := SIGMA ( zz ) . (zz : ROOM | numbers(zz));
 
// ((rr : small) <=> (ss : small))
swap(rr,ss) = 
  PRE rr : ROOM & ss : ROOM 
      & !xx.(xx : ROOM & xx = rr => not(rr = ss))
      & ((rr : small) => (numbers(ss) <= 4)) 
      & ((ss : small) => (numbers(rr) <= 4))
  THEN numbers := numbers <+ {rr |-> numbers(ss),ss|-> numbers(rr)}
  END

END

