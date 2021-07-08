/* Access
 * Author: Franklin
 * Creation date: 18/09/2020
 */
MACHINE Access

SETS USER; PRINTER; OPTION; PERMISSION = {ok, noaccess}
    
CONSTANTS options
    
PROPERTIES options : PRINTER <-> OPTION &
    dom(options) = PRINTER &
    ran(options) = OPTION
    
VARIABLES access, barred
    
INVARIANT access : USER <-> PRINTER 
    & barred : USER <-> OPTION
    & !uu.(uu : dom(access) => card(access[{uu}]) <= 6)
    & !uu.(uu : dom(barred) => card(barred[{uu}] /\ (access;options)[{uu}]) = 0)
    
INITIALISATION access, barred := {}, {}

OPERATIONS
    add(uu, pp) =
        PRE uu : USER & pp : PRINTER 
            & card(access[{uu}]) < 6
            & card(barred[{uu}] /\ options[{pp}]) = 0
        THEN access := access \/ {uu |-> pp}
    END;
    
    block (uu, pp) =
        PRE uu : USER & pp : PRINTER
        THEN access := access - {uu |-> pp}
    END;
    
    ban(uu) =
        PRE uu : USER
        THEN access := {uu} <<| access
    END;
    
    setbarred(uu, oo) =
        PRE uu : USER & oo : OPTION & uu |-> oo /: (access;options)
        THEN barred := barred \/ {uu |-> oo}
    END;
    
    unsetbarred(uu, oo) =
        PRE uu : USER & oo : OPTION
        THEN barred := barred - {uu |-> oo}
    END;
    
    unify(u1, u2) =
        PRE u1 : USER & u2 : USER 
            & card((access \/ {u1}*access[{u2}])[{u1}]) <= 6 
            & card((access \/ {u2}*access[{u1}])[{u2}]) <= 6 
            // u1 is not barred in u2-printer-options
            & card(barred[{u1}] /\ (access;options)[{u2}]) = 0
            // u2 is not barred in u1-printer-options
            & card(barred[{u2}] /\ (access;options)[{u1}]) = 0
        THEN access := access \/ {u1}*access[{u2}] \/ {u2}*access[{u1}]
    END;
    
    exchange(u1, u2) =
        PRE u1 : USER & u2 : USER 
            // users are not the same
            & !uu.(uu : USER & uu = u1 => not(u1 = u2))
            // u1 is not barred in u2-printer-options
            & card(barred[{u1}] /\ (access;options)[{u2}]) = 0
            // u2 is not barred in u1-printer-options
            & card(barred[{u2}] /\ (access;options)[{u1}]) = 0
        THEN access := access 
            - (({u1} <| access) \/ ({u2} <| access)) 
            \/ {u1}*access[{u2}] 
            \/ {u2}*access[{u1}]
    END;
    
    maintenance(pp, aa) = 
        PRE pp : PRINTER & aa : PRINTER 
            & !tt.(tt : PRINTER & tt = pp => not(pp = aa))
            & !oo.(oo : OPTION & oo : options[{pp}] => oo : options[{aa}])
            & !oo.(oo : OPTION & oo : options[{aa}] => oo : options[{pp}])
        THEN access := access - (access |> {pp}) \/ access~[{pp}]*{aa}
    END;
    
    ans <-- optionquery(uu, oo) =
        PRE uu : USER & oo : OPTION
        THEN IF uu |-> oo : (access;options)
            THEN ans := ok
            ELSE ans := noaccess
            END
    END;
    
    nn <-- printnumquery(pp) =
      PRE pp : PRINTER
      THEN nn := card(access |> {pp})
    END

END
