/* Hotelguests
 * Author: Franklin
 * Creation date: 30/09/2020
 */
MACHINE
    Hotelguests
    
SETS              
    NAME; REPORT = {present, notpresent}

CONSTANTS         
    empty, sze, ROOM

PROPERTIES        
    ROOM <: NATURAL1 & ROOM : FIN(ROOM) 
    & sze = 5  
    & card(ROOM) = sze 
    & empty : NAME

VARIABLES         
    guests, pguests

INVARIANT         
    guests : ROOM --> NAME &
    pguests : ROOM +-> NAME

INITIALISATION    
    guests, pguests := ROOM * {empty}, {}

OPERATIONS

    guestcheckin(rr,nn) =
        PRE rr : ROOM & nn : NAME & nn /= empty & nn /: ran(guests) & guests(rr) = empty
        THEN guests(rr) := nn || pguests := pguests \/ {rr |-> nn}
        END;

    guestcheckout(rr) = 
        PRE rr : ROOM
        THEN guests(rr) := empty || pguests := {rr} <<| pguests
        END;

    nn <-- guestquery(rr) = 
        PRE rr : ROOM
        THEN nn := guests(rr) 
        END;

    rr <-- presentquery(nn) =
        PRE nn : NAME & nn /= empty 
        THEN IF nn : ran(guests)
        THEN rr := present
        ELSE rr := notpresent
        END
        END;

    guestswap(rr,ss) = 
        PRE rr : ROOM & ss : ROOM
        THEN guests := guests <+ {rr |-> guests(ss),ss|-> guests(rr)} ||
             pguests := pguests <+ {rr |-> pguests(ss),ss|-> pguests(rr)}
        END;

    step(rr) =
        PRE rr : ROOM & rr-1 : ROOM & rr : dom(pguests)
        THEN guests := guests <+ {rr-1 |-> guests(rr), rr |-> empty} || 
             pguests := (pguests <+ {rr-1 |-> pguests(rr)}) - {rr |-> pguests(rr)}
        END

END