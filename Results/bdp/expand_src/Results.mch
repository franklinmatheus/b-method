/* Results
 * Author: Franklin
 * Creation date: 28/09/2020
 */
MACHINE
    Results

SETS
    RUNNER

ABSTRACT_VARIABLES
    finish

INVARIANT
    finish : iseq ( RUNNER )

INITIALISATION
    finish := []

OPERATIONS

    finished ( rr ) =
      PRE rr : RUNNER & rr /: ran ( finish )
      THEN finish := finish <- rr
      END ;

    rr <-- query ( pp ) =
      PRE pp : NAT1 & pp <= size ( finish )
      THEN rr := finish ( pp )
      END ;

    disqualify ( pp ) =
      PRE pp : NAT1 & pp <= size ( finish )
      THEN finish := ( finish /|\ pp - 1 ) ^ ( finish \|/ pp )
      END ;

    ss <-- medals =
      PRE size ( finish ) >= 3
      THEN ss := finish /|\ 3
      END ;

    pp <-- position ( rr ) =
        PRE rr : RUNNER & rr : ran ( finish )
        THEN
            pp := finish ~ ( rr )
            //ANY xx WHERE xx : NAT1 & xx : dom(finish) & finish(xx) = rr THEN pp := xx END
        END ;

    remove ( rr ) =
        PRE rr : RUNNER & rr : ran ( finish )
        THEN finish := ( finish /|\ finish ~ ( rr ) - 1 ) ^ ( finish \|/ finish ~ ( rr ) )
        END

END
