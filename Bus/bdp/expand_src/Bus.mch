/* Bus
 * Author: Franklin
 * Creation date: 18/09/2020
 */
MACHINE Bus

ABSTRACT_VARIABLES tickets , passengers

INVARIANT tickets : NATURAL &
    passengers : NATURAL &
    tickets <= passengers + 1 &
    passengers <= tickets + 45

INITIALISATION tickets , passengers := 0 , 0

OPERATIONS
    buy ( mm ) =
        PRE mm : NATURAL & tickets + mm <= passengers + 1
        THEN tickets := tickets + mm
    END ;

    board ( nn ) =
        PRE nn : NATURAL & passengers + nn <= tickets + 45
        THEN passengers := passengers + nn
    END ;

    double =
        PRE 2 * passengers <= 2 * tickets + 45 & 2 * tickets <= 2 * passengers + 1
        THEN tickets , passengers := 2 * tickets , 2 * passengers
    END

END
