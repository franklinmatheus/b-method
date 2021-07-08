/* Deliveries
 * Author: Franklin
 * Creation date: 05/10/2020
 */
MACHINE
    Deliveries

SETS
    ADDRESS; ITEM

VARIABLES
    nogo, requests
    
INVARIANT
    nogo <: ADDRESS &
    nogo : FIN(nogo) &
    requests : ITEM +-> ADDRESS &
    requests : FIN(requests)
    
INITIALISATION
    ANY aa WHERE aa <: ADDRESS & aa : FIN(aa) & card(aa) < 5 THEN nogo := aa END ||
    requests := {}

OPERATIONS
    
    load(aa,ii) =
        PRE ii : ITEM & aa : ADDRESS & aa /: nogo
        THEN requests := {ii |-> aa}
        END;
    
    oa, oi <-- drop =
        PRE not(card(requests) = 0)
        THEN 
            ANY ii, aa
            WHERE ii : ITEM & aa : ADDRESS & ii |-> aa : requests
            THEN requests := requests - {ii |-> aa} ||
                oa := aa ||
                oi := ii
        END
    END;
    
    endofday =
        PRE TRUE=TRUE
        THEN 
            ANY oo
            WHERE oo : 0..1
            THEN
                SELECT oo = 0 THEN requests := {}
                WHEN oo = 1 THEN requests := requests
                END
        END
    END;
    
    warning(aa) =
        PRE aa : ADDRESS
        THEN
            SELECT aa : nogo THEN requests := requests |>> {aa}
            WHEN aa : nogo THEN nogo := nogo - {aa}
            WHEN aa /: nogo & card(requests~[{aa}]) = 0 THEN nogo := nogo \/ {aa}
            END
        END

END
