/* Paperround
 * Author: Franklin
 * Creation date: 18/09/2020
 */
MACHINE
    Paperround

ABSTRACT_VARIABLES papers , magazines

INVARIANT papers <: 1 .. 163 &
    magazines <: papers &
    magazines : FIN ( magazines ) &
    papers : FIN ( papers ) &
    card ( papers ) <= 60 &
    2 * card ( magazines ) <= card ( papers )


INITIALISATION papers := {} || magazines := {}

OPERATIONS
    addpaper ( hh ) =
        PRE hh : 1 .. 163 & card ( papers ) < 60
        THEN papers := papers \/ { hh }
    END ;

    /*
    4.3
    A operação se torna inconsistente ao mudar a invariante.
    
    2 * card(magazines \/ {hh}) <= card(papers)
    */

    addmagazine ( hh ) =
        PRE hh : papers & 2 * card ( magazines \/ { hh } ) <= card ( papers )
        THEN magazines := magazines \/ { hh }
    END ;

    /*
    4.3
    A operação se torna inconsistente ao mudar a invariante.
    */
    remove ( hh ) =
        PRE hh : 1 .. 163 & 2 * card ( magazines - { hh } ) <= card ( papers - { hh } )
        THEN papers := papers - { hh } || magazines := magazines - { hh }
    END ;

    // 4.1
    allmags =
        PRE 2 * card ( papers ) <= card ( papers )
        THEN magazines := papers
    END ;

    /* 
    4.2
    Pré-condição inicial:
    - [papers := papers - {hh}](magazines <: papers & card(papers) <= 60)
    - magazines <: papers - {hh} & card(papers - {hh} <= 60)
    Falha, pois magazines pode ter {hh}.
    Assim, a pré-condição deve ser:
    - hh : papers & hh /: magazines
    
    4.3
    A operação se torna inconsistente ao mudar a invariante.
    */
    removehouse ( hh ) =
        PRE hh : papers & hh /: magazines & 2 * card ( magazines ) <= card ( papers - { hh } )
        THEN papers := papers - { hh }
    END

END
