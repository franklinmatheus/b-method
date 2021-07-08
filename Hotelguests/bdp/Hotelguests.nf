Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Hotelguests))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Hotelguests))==(Machine(Hotelguests));
  Level(Machine(Hotelguests))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Hotelguests)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Hotelguests))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Hotelguests))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Hotelguests))==(?);
  List_Includes(Machine(Hotelguests))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Hotelguests))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Hotelguests))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Hotelguests))==(?);
  Context_List_Variables(Machine(Hotelguests))==(?);
  Abstract_List_Variables(Machine(Hotelguests))==(?);
  Local_List_Variables(Machine(Hotelguests))==(pguests,guests);
  List_Variables(Machine(Hotelguests))==(pguests,guests);
  External_List_Variables(Machine(Hotelguests))==(pguests,guests)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Hotelguests))==(?);
  Abstract_List_VisibleVariables(Machine(Hotelguests))==(?);
  External_List_VisibleVariables(Machine(Hotelguests))==(?);
  Expanded_List_VisibleVariables(Machine(Hotelguests))==(?);
  List_VisibleVariables(Machine(Hotelguests))==(?);
  Internal_List_VisibleVariables(Machine(Hotelguests))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Hotelguests))==(btrue);
  Gluing_List_Invariant(Machine(Hotelguests))==(btrue);
  Expanded_List_Invariant(Machine(Hotelguests))==(btrue);
  Abstract_List_Invariant(Machine(Hotelguests))==(btrue);
  Context_List_Invariant(Machine(Hotelguests))==(btrue);
  List_Invariant(Machine(Hotelguests))==(guests: ROOM --> NAME & pguests: ROOM +-> NAME)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Hotelguests))==(btrue);
  Abstract_List_Assertions(Machine(Hotelguests))==(btrue);
  Context_List_Assertions(Machine(Hotelguests))==(btrue);
  List_Assertions(Machine(Hotelguests))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Hotelguests))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Hotelguests))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Hotelguests))==(guests,pguests:=ROOM*{empty},{});
  Context_List_Initialisation(Machine(Hotelguests))==(skip);
  List_Initialisation(Machine(Hotelguests))==(guests,pguests:=ROOM*{empty},{})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Hotelguests))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Hotelguests))==(btrue);
  List_Constraints(Machine(Hotelguests))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Hotelguests))==(guestcheckin,guestcheckout,guestquery,presentquery,guestswap,step);
  List_Operations(Machine(Hotelguests))==(guestcheckin,guestcheckout,guestquery,presentquery,guestswap,step)
END
&
THEORY ListInputX IS
  List_Input(Machine(Hotelguests),guestcheckin)==(rr,nn);
  List_Input(Machine(Hotelguests),guestcheckout)==(rr);
  List_Input(Machine(Hotelguests),guestquery)==(rr);
  List_Input(Machine(Hotelguests),presentquery)==(nn);
  List_Input(Machine(Hotelguests),guestswap)==(rr,ss);
  List_Input(Machine(Hotelguests),step)==(rr)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Hotelguests),guestcheckin)==(?);
  List_Output(Machine(Hotelguests),guestcheckout)==(?);
  List_Output(Machine(Hotelguests),guestquery)==(nn);
  List_Output(Machine(Hotelguests),presentquery)==(rr);
  List_Output(Machine(Hotelguests),guestswap)==(?);
  List_Output(Machine(Hotelguests),step)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Hotelguests),guestcheckin)==(guestcheckin(rr,nn));
  List_Header(Machine(Hotelguests),guestcheckout)==(guestcheckout(rr));
  List_Header(Machine(Hotelguests),guestquery)==(nn <-- guestquery(rr));
  List_Header(Machine(Hotelguests),presentquery)==(rr <-- presentquery(nn));
  List_Header(Machine(Hotelguests),guestswap)==(guestswap(rr,ss));
  List_Header(Machine(Hotelguests),step)==(step(rr))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Hotelguests),guestcheckin)==(rr: ROOM & nn: NAME & nn/=empty & nn/:ran(guests) & guests(rr) = empty);
  List_Precondition(Machine(Hotelguests),guestcheckout)==(rr: ROOM);
  List_Precondition(Machine(Hotelguests),guestquery)==(rr: ROOM);
  List_Precondition(Machine(Hotelguests),presentquery)==(nn: NAME & nn/=empty);
  List_Precondition(Machine(Hotelguests),guestswap)==(rr: ROOM & ss: ROOM);
  List_Precondition(Machine(Hotelguests),step)==(rr: ROOM & rr-1: ROOM & rr: dom(pguests))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Hotelguests),step)==(rr: ROOM & rr-1: ROOM & rr: dom(pguests) | guests,pguests:=guests<+{rr-1|->guests(rr),rr|->empty},(pguests<+{rr-1|->pguests(rr)})-{rr|->pguests(rr)});
  Expanded_List_Substitution(Machine(Hotelguests),guestswap)==(rr: ROOM & ss: ROOM | guests,pguests:=guests<+{rr|->guests(ss),ss|->guests(rr)},pguests<+{rr|->pguests(ss),ss|->pguests(rr)});
  Expanded_List_Substitution(Machine(Hotelguests),presentquery)==(nn: NAME & nn/=empty | nn: ran(guests) ==> rr:=present [] not(nn: ran(guests)) ==> rr:=notpresent);
  Expanded_List_Substitution(Machine(Hotelguests),guestquery)==(rr: ROOM | nn:=guests(rr));
  Expanded_List_Substitution(Machine(Hotelguests),guestcheckout)==(rr: ROOM | guests,pguests:=guests<+{rr|->empty},{rr}<<|pguests);
  Expanded_List_Substitution(Machine(Hotelguests),guestcheckin)==(rr: ROOM & nn: NAME & nn/=empty & nn/:ran(guests) & guests(rr) = empty | guests,pguests:=guests<+{rr|->nn},pguests\/{rr|->nn});
  List_Substitution(Machine(Hotelguests),guestcheckin)==(guests(rr):=nn || pguests:=pguests\/{rr|->nn});
  List_Substitution(Machine(Hotelguests),guestcheckout)==(guests(rr):=empty || pguests:={rr}<<|pguests);
  List_Substitution(Machine(Hotelguests),guestquery)==(nn:=guests(rr));
  List_Substitution(Machine(Hotelguests),presentquery)==(IF nn: ran(guests) THEN rr:=present ELSE rr:=notpresent END);
  List_Substitution(Machine(Hotelguests),guestswap)==(guests:=guests<+{rr|->guests(ss),ss|->guests(rr)} || pguests:=pguests<+{rr|->pguests(ss),ss|->pguests(rr)});
  List_Substitution(Machine(Hotelguests),step)==(guests:=guests<+{rr-1|->guests(rr),rr|->empty} || pguests:=(pguests<+{rr-1|->pguests(rr)})-{rr|->pguests(rr)})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Hotelguests))==(empty,sze,ROOM);
  Inherited_List_Constants(Machine(Hotelguests))==(?);
  List_Constants(Machine(Hotelguests))==(empty,sze,ROOM)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Hotelguests),NAME)==(?);
  Context_List_Enumerated(Machine(Hotelguests))==(?);
  Context_List_Defered(Machine(Hotelguests))==(?);
  Context_List_Sets(Machine(Hotelguests))==(?);
  List_Valuable_Sets(Machine(Hotelguests))==(NAME);
  Inherited_List_Enumerated(Machine(Hotelguests))==(?);
  Inherited_List_Defered(Machine(Hotelguests))==(?);
  Inherited_List_Sets(Machine(Hotelguests))==(?);
  List_Enumerated(Machine(Hotelguests))==(REPORT);
  List_Defered(Machine(Hotelguests))==(NAME);
  List_Sets(Machine(Hotelguests))==(NAME,REPORT);
  Set_Definition(Machine(Hotelguests),REPORT)==({present,notpresent})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Hotelguests))==(?);
  Expanded_List_HiddenConstants(Machine(Hotelguests))==(?);
  List_HiddenConstants(Machine(Hotelguests))==(?);
  External_List_HiddenConstants(Machine(Hotelguests))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Hotelguests))==(btrue);
  Context_List_Properties(Machine(Hotelguests))==(btrue);
  Inherited_List_Properties(Machine(Hotelguests))==(btrue);
  List_Properties(Machine(Hotelguests))==(ROOM <: NATURAL1 & ROOM: FIN(ROOM) & sze = 5 & card(ROOM) = sze & empty: NAME & NAME: FIN(INTEGER) & not(NAME = {}) & REPORT: FIN(INTEGER) & not(REPORT = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Hotelguests),guestcheckin)==(?);
  List_ANY_Var(Machine(Hotelguests),guestcheckout)==(?);
  List_ANY_Var(Machine(Hotelguests),guestquery)==(?);
  List_ANY_Var(Machine(Hotelguests),presentquery)==(?);
  List_ANY_Var(Machine(Hotelguests),guestswap)==(?);
  List_ANY_Var(Machine(Hotelguests),step)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Hotelguests)) == (empty,sze,ROOM,NAME,REPORT,present,notpresent | ? | pguests,guests | ? | guestcheckin,guestcheckout,guestquery,presentquery,guestswap,step | ? | ? | ? | Hotelguests);
  List_Of_HiddenCst_Ids(Machine(Hotelguests)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Hotelguests)) == (empty,sze,ROOM);
  List_Of_VisibleVar_Ids(Machine(Hotelguests)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Hotelguests)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Hotelguests)) == (Type(NAME) == Cst(SetOf(atype(NAME,"[NAME","]NAME")));Type(REPORT) == Cst(SetOf(etype(REPORT,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Hotelguests)) == (Type(present) == Cst(etype(REPORT,0,1));Type(notpresent) == Cst(etype(REPORT,0,1));Type(empty) == Cst(atype(NAME,?,?));Type(sze) == Cst(btype(INTEGER,?,?));Type(ROOM) == Cst(SetOf(btype(INTEGER,"[ROOM","]ROOM"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Hotelguests)) == (Type(pguests) == Mvl(SetOf(btype(INTEGER,?,?)*atype(NAME,?,?)));Type(guests) == Mvl(SetOf(btype(INTEGER,"[ROOM","]ROOM")*atype(NAME,"[NAME","]NAME"))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Hotelguests)) == (Type(step) == Cst(No_type,btype(INTEGER,?,?));Type(guestswap) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(presentquery) == Cst(etype(REPORT,?,?),atype(NAME,?,?));Type(guestquery) == Cst(atype(NAME,?,?),btype(INTEGER,?,?));Type(guestcheckout) == Cst(No_type,btype(INTEGER,?,?));Type(guestcheckin) == Cst(No_type,btype(INTEGER,?,?)*atype(NAME,?,?)));
  Observers(Machine(Hotelguests)) == (Type(presentquery) == Cst(etype(REPORT,?,?),atype(NAME,?,?));Type(guestquery) == Cst(atype(NAME,?,?),btype(INTEGER,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
