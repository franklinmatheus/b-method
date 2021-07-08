Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Doors))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Doors))==(Machine(Doors));
  Level(Machine(Doors))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Doors)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Doors))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Doors))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Doors))==(?);
  List_Includes(Machine(Doors))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Doors))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Doors))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Doors))==(?);
  Context_List_Variables(Machine(Doors))==(?);
  Abstract_List_Variables(Machine(Doors))==(?);
  Local_List_Variables(Machine(Doors))==(position);
  List_Variables(Machine(Doors))==(position);
  External_List_Variables(Machine(Doors))==(position)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Doors))==(?);
  Abstract_List_VisibleVariables(Machine(Doors))==(?);
  External_List_VisibleVariables(Machine(Doors))==(?);
  Expanded_List_VisibleVariables(Machine(Doors))==(?);
  List_VisibleVariables(Machine(Doors))==(?);
  Internal_List_VisibleVariables(Machine(Doors))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Doors))==(btrue);
  Gluing_List_Invariant(Machine(Doors))==(btrue);
  Expanded_List_Invariant(Machine(Doors))==(btrue);
  Abstract_List_Invariant(Machine(Doors))==(btrue);
  Context_List_Invariant(Machine(Doors))==(btrue);
  List_Invariant(Machine(Doors))==(position: DOOR --> POSITION)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Doors))==(btrue);
  Abstract_List_Assertions(Machine(Doors))==(btrue);
  Context_List_Assertions(Machine(Doors))==(btrue);
  List_Assertions(Machine(Doors))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Doors))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Doors))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Doors))==(position:=DOOR*{closed});
  Context_List_Initialisation(Machine(Doors))==(skip);
  List_Initialisation(Machine(Doors))==(position:=DOOR*{closed})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Doors))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Doors))==(btrue);
  List_Constraints(Machine(Doors))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Doors))==(opening,closedoor);
  List_Operations(Machine(Doors))==(opening,closedoor)
END
&
THEORY ListInputX IS
  List_Input(Machine(Doors),opening)==(dd);
  List_Input(Machine(Doors),closedoor)==(dd)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Doors),opening)==(?);
  List_Output(Machine(Doors),closedoor)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Doors),opening)==(opening(dd));
  List_Header(Machine(Doors),closedoor)==(closedoor(dd))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Doors),opening)==(dd: DOOR);
  List_Precondition(Machine(Doors),closedoor)==(dd: DOOR)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Doors),closedoor)==(dd: DOOR | position:=position<+{dd|->closed});
  Expanded_List_Substitution(Machine(Doors),opening)==(dd: DOOR | position:=position<+{dd|->open});
  List_Substitution(Machine(Doors),opening)==(position(dd):=open);
  List_Substitution(Machine(Doors),closedoor)==(position(dd):=closed)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Doors))==(?);
  Inherited_List_Constants(Machine(Doors))==(?);
  List_Constants(Machine(Doors))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Doors),DOOR)==(?);
  Context_List_Enumerated(Machine(Doors))==(?);
  Context_List_Defered(Machine(Doors))==(?);
  Context_List_Sets(Machine(Doors))==(?);
  List_Valuable_Sets(Machine(Doors))==(DOOR);
  Inherited_List_Enumerated(Machine(Doors))==(?);
  Inherited_List_Defered(Machine(Doors))==(?);
  Inherited_List_Sets(Machine(Doors))==(?);
  List_Enumerated(Machine(Doors))==(POSITION);
  List_Defered(Machine(Doors))==(DOOR);
  List_Sets(Machine(Doors))==(DOOR,POSITION);
  Set_Definition(Machine(Doors),POSITION)==({open,closed})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Doors))==(?);
  Expanded_List_HiddenConstants(Machine(Doors))==(?);
  List_HiddenConstants(Machine(Doors))==(?);
  External_List_HiddenConstants(Machine(Doors))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Doors))==(btrue);
  Context_List_Properties(Machine(Doors))==(btrue);
  Inherited_List_Properties(Machine(Doors))==(btrue);
  List_Properties(Machine(Doors))==(DOOR: FIN(INTEGER) & not(DOOR = {}) & POSITION: FIN(INTEGER) & not(POSITION = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Doors),opening)==(?);
  List_ANY_Var(Machine(Doors),closedoor)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Doors)) == (DOOR,POSITION,open,closed | ? | position | ? | opening,closedoor | ? | ? | ? | Doors);
  List_Of_HiddenCst_Ids(Machine(Doors)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Doors)) == (?);
  List_Of_VisibleVar_Ids(Machine(Doors)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Doors)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Doors)) == (Type(DOOR) == Cst(SetOf(atype(DOOR,"[DOOR","]DOOR")));Type(POSITION) == Cst(SetOf(etype(POSITION,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Doors)) == (Type(open) == Cst(etype(POSITION,0,1));Type(closed) == Cst(etype(POSITION,0,1)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Doors)) == (Type(position) == Mvl(SetOf(atype(DOOR,"[DOOR","]DOOR")*etype(POSITION,0,1))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Doors)) == (Type(closedoor) == Cst(No_type,atype(DOOR,?,?));Type(opening) == Cst(No_type,atype(DOOR,?,?)))
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
