/* Testset
 * Author: Franklin
 * Creation date: 06/10/2020
 */
MACHINE
    Testset

SETS
    SET1 ; SET2

ABSTRACT_VARIABLES
    cross

INVARIANT
    cross : SET1 <-> SET2

INITIALISATION
    cross := SET1 * SET2

OPERATIONS

    out <-- get1 ( ss ) =
        PRE ss : SET2
        THEN out := cross ~ [ { ss } ]
        END

END
