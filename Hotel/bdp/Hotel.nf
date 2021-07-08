Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Hotel))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Hotel))==(Machine(Hotel));
  Level(Machine(Hotel))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Hotel)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Hotel))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Hotel))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Hotel))==(?);
  List_Includes(Machine(Hotel))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Hotel))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Hotel))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Hotel))==(?);
  Context_List_Variables(Machine(Hotel))==(?);
  Abstract_List_Variables(Machine(Hotel))==(?);
  Local_List_Variables(Machine(Hotel))==(numbers);
  List_Variables(Machine(Hotel))==(numbers);
  External_List_Variables(Machine(Hotel))==(numbers)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Hotel))==(?);
  Abstract_List_VisibleVariables(Machine(Hotel))==(?);
  External_List_VisibleVariables(Machine(Hotel))==(?);
  Expanded_List_VisibleVariables(Machine(Hotel))==(?);
  List_VisibleVariables(Machine(Hotel))==(?);
  Internal_List_VisibleVariables(Machine(Hotel))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Hotel))==(btrue);
  Gluing_List_Invariant(Machine(Hotel))==(btrue);
  Expanded_List_Invariant(Machine(Hotel))==(btrue);
  Abstract_List_Invariant(Machine(Hotel))==(btrue);
  Context_List_Invariant(Machine(Hotel))==(btrue);
  List_Invariant(Machine(Hotel))==(numbers: ROOM --> 0..6 & numbers[small] <: 0..4)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Hotel))==(btrue);
  Abstract_List_Assertions(Machine(Hotel))==(btrue);
  Context_List_Assertions(Machine(Hotel))==(btrue);
  List_Assertions(Machine(Hotel))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Hotel))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Hotel))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Hotel))==(numbers:=ROOM*{0});
  Context_List_Initialisation(Machine(Hotel))==(skip);
  List_Initialisation(Machine(Hotel))==(numbers:=ROOM*{0})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Hotel))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Hotel))==(btrue);
  List_Constraints(Machine(Hotel))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Hotel))==(checkin,checkout,roomquery,vacancies,totalguests,swap);
  List_Operations(Machine(Hotel))==(checkin,checkout,roomquery,vacancies,totalguests,swap)
END
&
THEORY ListInputX IS
  List_Input(Machine(Hotel),checkin)==(rr,nn);
  List_Input(Machine(Hotel),checkout)==(rr);
  List_Input(Machine(Hotel),roomquery)==(rr);
  List_Input(Machine(Hotel),vacancies)==(?);
  List_Input(Machine(Hotel),totalguests)==(?);
  List_Input(Machine(Hotel),swap)==(rr,ss)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Hotel),checkin)==(?);
  List_Output(Machine(Hotel),checkout)==(?);
  List_Output(Machine(Hotel),roomquery)==(nn);
  List_Output(Machine(Hotel),vacancies)==(nn);
  List_Output(Machine(Hotel),totalguests)==(nn);
  List_Output(Machine(Hotel),swap)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Hotel),checkin)==(checkin(rr,nn));
  List_Header(Machine(Hotel),checkout)==(checkout(rr));
  List_Header(Machine(Hotel),roomquery)==(nn <-- roomquery(rr));
  List_Header(Machine(Hotel),vacancies)==(nn <-- vacancies);
  List_Header(Machine(Hotel),totalguests)==(nn <-- totalguests);
  List_Header(Machine(Hotel),swap)==(swap(rr,ss))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Hotel),checkin)==(rr: ROOM & nn: 1..6 & numbers(rr) = 0 & (rr: small => nn<=4));
  List_Precondition(Machine(Hotel),checkout)==(rr: ROOM);
  List_Precondition(Machine(Hotel),roomquery)==(rr: ROOM);
  List_Precondition(Machine(Hotel),vacancies)==(btrue);
  List_Precondition(Machine(Hotel),totalguests)==(btrue);
  List_Precondition(Machine(Hotel),swap)==(rr: ROOM & ss: ROOM & !xx.(xx: ROOM & xx = rr => not(rr = ss)) & (rr: small => numbers(ss)<=4) & (ss: small => numbers(rr)<=4))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Hotel),swap)==(rr: ROOM & ss: ROOM & !xx.(xx: ROOM & xx = rr => not(rr = ss)) & (rr: small => numbers(ss)<=4) & (ss: small => numbers(rr)<=4) | numbers:=numbers<+{rr|->numbers(ss),ss|->numbers(rr)});
  Expanded_List_Substitution(Machine(Hotel),totalguests)==(btrue | nn:=SIGMA(zz).(zz: ROOM | numbers(zz)));
  Expanded_List_Substitution(Machine(Hotel),vacancies)==(btrue | nn:=card(numbers|>{0}));
  Expanded_List_Substitution(Machine(Hotel),roomquery)==(rr: ROOM | nn:=numbers(rr));
  Expanded_List_Substitution(Machine(Hotel),checkout)==(rr: ROOM | numbers:=numbers<+{rr|->0});
  Expanded_List_Substitution(Machine(Hotel),checkin)==(rr: ROOM & nn: 1..6 & numbers(rr) = 0 & (rr: small => nn<=4) | numbers:=numbers<+{rr|->nn});
  List_Substitution(Machine(Hotel),checkin)==(numbers(rr):=nn);
  List_Substitution(Machine(Hotel),checkout)==(numbers(rr):=0);
  List_Substitution(Machine(Hotel),roomquery)==(nn:=numbers(rr));
  List_Substitution(Machine(Hotel),vacancies)==(nn:=card(numbers|>{0}));
  List_Substitution(Machine(Hotel),totalguests)==(nn:=SIGMA(zz).(zz: ROOM | numbers(zz)));
  List_Substitution(Machine(Hotel),swap)==(numbers:=numbers<+{rr|->numbers(ss),ss|->numbers(rr)})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Hotel))==(small,sze);
  Inherited_List_Constants(Machine(Hotel))==(?);
  List_Constants(Machine(Hotel))==(small,sze)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Hotel),ROOM)==(?);
  Context_List_Enumerated(Machine(Hotel))==(?);
  Context_List_Defered(Machine(Hotel))==(?);
  Context_List_Sets(Machine(Hotel))==(?);
  List_Valuable_Sets(Machine(Hotel))==(ROOM);
  Inherited_List_Enumerated(Machine(Hotel))==(?);
  Inherited_List_Defered(Machine(Hotel))==(?);
  Inherited_List_Sets(Machine(Hotel))==(?);
  List_Enumerated(Machine(Hotel))==(?);
  List_Defered(Machine(Hotel))==(ROOM);
  List_Sets(Machine(Hotel))==(ROOM)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Hotel))==(?);
  Expanded_List_HiddenConstants(Machine(Hotel))==(?);
  List_HiddenConstants(Machine(Hotel))==(?);
  External_List_HiddenConstants(Machine(Hotel))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Hotel))==(btrue);
  Context_List_Properties(Machine(Hotel))==(btrue);
  Inherited_List_Properties(Machine(Hotel))==(btrue);
  List_Properties(Machine(Hotel))==(sze: NATURAL1 & card(ROOM) = sze & small <: ROOM & ROOM: FIN(INTEGER) & not(ROOM = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Hotel),checkin)==(?);
  List_ANY_Var(Machine(Hotel),checkout)==(?);
  List_ANY_Var(Machine(Hotel),roomquery)==(?);
  List_ANY_Var(Machine(Hotel),vacancies)==(?);
  List_ANY_Var(Machine(Hotel),totalguests)==(?);
  List_ANY_Var(Machine(Hotel),swap)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Hotel)) == (small,sze,ROOM | ? | numbers | ? | checkin,checkout,roomquery,vacancies,totalguests,swap | ? | ? | ? | Hotel);
  List_Of_HiddenCst_Ids(Machine(Hotel)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Hotel)) == (small,sze);
  List_Of_VisibleVar_Ids(Machine(Hotel)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Hotel)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Hotel)) == (Type(ROOM) == Cst(SetOf(atype(ROOM,"[ROOM","]ROOM"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Hotel)) == (Type(small) == Cst(SetOf(atype(ROOM,"[small","]small")));Type(sze) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Hotel)) == (Type(numbers) == Mvl(SetOf(atype(ROOM,"[ROOM","]ROOM")*btype(INTEGER,0,6))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Hotel)) == (Type(swap) == Cst(No_type,atype(ROOM,?,?)*atype(ROOM,?,?));Type(totalguests) == Cst(btype(INTEGER,?,?),No_type);Type(vacancies) == Cst(btype(INTEGER,?,?),No_type);Type(roomquery) == Cst(btype(INTEGER,?,?),atype(ROOM,?,?));Type(checkout) == Cst(No_type,atype(ROOM,?,?));Type(checkin) == Cst(No_type,atype(ROOM,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(Hotel)) == (Type(totalguests) == Cst(btype(INTEGER,?,?),No_type);Type(vacancies) == Cst(btype(INTEGER,?,?),No_type);Type(roomquery) == Cst(btype(INTEGER,?,?),atype(ROOM,?,?)))
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
