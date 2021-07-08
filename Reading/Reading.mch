/* Reading
 * Author: Franklin
 * Creation date: 28/09/2020
 */
MACHINE Reading

SETS
    READER; 
    BOOK; 
    COPY; 
    RESPONSE = {yes, no}

VARIABLES         
    hasread, reading, copyof, copies, books

INVARIANT         
    copies <: COPY
    & books <: BOOK
    & copyof : copies >-> books
    & hasread : READER <-> BOOK 
    & reading : READER >+> COPY 
    & (reading ; copyof) /\ hasread = {}
    

INITIALISATION    
    hasread := {} || reading := {} || copyof := {} || copies := {} || books := {}

OPERATIONS

add(cc,bb) =
    PRE cc : COPY & bb : BOOK & cc /: copies & cc |-> bb /: copyof
    THEN copies := copies \/ {cc} || books := books \/ {bb} || copyof := {cc |-> bb}
    END;

start(rr,cc) =
    PRE rr : READER 
    & cc : COPY 
    & copyof(cc) /: hasread[{rr}]
    & rr /: dom(reading) 
    & cc /: ran(reading)
    THEN reading := reading \/ {rr |-> cc}
    END;

finished(rr,cc) =
    PRE rr : READER 
    & cc : COPY 
    & rr:dom(reading) 
    & cc = reading(rr)
    THEN hasread := hasread \/ {rr |-> copyof(cc)}
        || reading := {rr} <<| reading
    END;

resp <-- precurrentquery(rr) =
    PRE rr : READER
    THEN
    IF rr : dom(reading)
        THEN resp := yes
        ELSE resp := no
        END
    END;

bb <-- currentquery(rr) =
    PRE rr : READER & rr : dom(reading)
    THEN bb := copyof(reading(rr))
    END;

resp <-- hasreadquery(rr,bb) =
    PRE rr : READER & bb : BOOK
    THEN
    IF bb : hasread[{rr}]
        THEN resp := yes
        ELSE resp := no
        END
    END

END
