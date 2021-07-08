MACHINE           Port

SETS              SHIP ; QUAY

ABSTRACT_VARIABLES waiting , docked

INVARIANT         waiting : iseq ( SHIP )
                  & docked : QUAY >+> SHIP & ran ( waiting ) /\ ran ( docked ) = {}

INITIALISATION    waiting := <> || docked := {}

OPERATIONS

arrive ( ss ) =
  PRE ss : SHIP & ss /: ran ( waiting ) & ss /: ran ( docked )
          & card ( waiting ) < MAXINT
  THEN waiting := waiting <- ss
  END ;

dock ( qq ) =
  PRE waiting /= <> & qq : QUAY & qq /: dom ( docked )
  THEN waiting := tail ( waiting ) || docked ( qq ) := first ( waiting )
  END ;

qq <-- leave ( ss ) =
  PRE ss : SHIP & ss : ran ( docked )
  THEN docked := docked |>> { ss } || qq := docked ~ ( ss )
  END ;

nn <-- numberwaiting =
  nn := size ( waiting ) ;
jumpqueue ( ss , qq ) =
  PRE ss : SHIP & ss /: ran ( docked ) & ss /: ran ( waiting ) & qq : QUAY & qq /: dom ( docked )
  THEN docked ( qq ) := ss
  END
END
