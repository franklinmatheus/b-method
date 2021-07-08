Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Locks))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Locks))==(Machine(Locks));
  Level(Machine(Locks))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Locks)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Locks))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Locks))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Locks))==(Doors);
  List_Includes(Machine(Locks))==(Doors)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Locks))==(closedoor)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Locks))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Locks))==(?);
  Context_List_Variables(Machine(Locks))==(?);
  Abstract_List_Variables(Machine(Locks))==(?);
  Local_List_Variables(Machine(Locks))==(status);
  List_Variables(Machine(Locks))==(status,position);
  External_List_Variables(Machine(Locks))==(status,position)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Locks))==(?);
  Abstract_List_VisibleVariables(Machine(Locks))==(?);
  External_List_VisibleVariables(Machine(Locks))==(?);
  Expanded_List_VisibleVariables(Machine(Locks))==(?);
  List_VisibleVariables(Machine(Locks))==(?);
  Internal_List_VisibleVariables(Machine(Locks))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Locks))==(btrue);
  Gluing_List_Invariant(Machine(Locks))==(btrue);
  Abstract_List_Invariant(Machine(Locks))==(btrue);
  Expanded_List_Invariant(Machine(Locks))==(position: DOOR --> POSITION);
  Context_List_Invariant(Machine(Locks))==(btrue);
  List_Invariant(Machine(Locks))==(status: DOOR --> STATUS & position~[{open}] <: status~[{unlocked}])
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Locks))==(btrue);
  Expanded_List_Assertions(Machine(Locks))==(btrue);
  Context_List_Assertions(Machine(Locks))==(btrue);
  List_Assertions(Machine(Locks))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Locks))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Locks))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Locks))==(position:=DOOR*{closed};status:=DOOR*{locked});
  Context_List_Initialisation(Machine(Locks))==(skip);
  List_Initialisation(Machine(Locks))==(status:=DOOR*{locked})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Locks))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Locks),Machine(Doors))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Locks),Machine(Doors))==(btrue);
  List_Context_Constraints(Machine(Locks))==(btrue);
  List_Constraints(Machine(Locks))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Locks))==(opendoor,unlockdoor,lockdoor,quickclose,closedoor);
  List_Operations(Machine(Locks))==(opendoor,unlockdoor,lockdoor,quickclose,closedoor)
END
&
THEORY ListInputX IS
  List_Input(Machine(Locks),closedoor)==(dd);
  List_Input(Machine(Locks),opendoor)==(dd);
  List_Input(Machine(Locks),unlockdoor)==(dd);
  List_Input(Machine(Locks),lockdoor)==(dd);
  List_Input(Machine(Locks),quickclose)==(dd)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Locks),closedoor)==(?);
  List_Output(Machine(Locks),opendoor)==(?);
  List_Output(Machine(Locks),unlockdoor)==(?);
  List_Output(Machine(Locks),lockdoor)==(?);
  List_Output(Machine(Locks),quickclose)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Locks),closedoor)==(closedoor(dd));
  List_Header(Machine(Locks),opendoor)==(opendoor(dd));
  List_Header(Machine(Locks),unlockdoor)==(unlockdoor(dd));
  List_Header(Machine(Locks),lockdoor)==(lockdoor(dd));
  List_Header(Machine(Locks),quickclose)==(quickclose(dd))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(Locks),closedoor)==(dd: DOOR);
  List_Precondition(Machine(Locks),closedoor)==(dd: DOOR);
  List_Precondition(Machine(Locks),opendoor)==(dd: DOOR & status(dd) = unlocked);
  List_Precondition(Machine(Locks),unlockdoor)==(dd: DOOR & position(dd) = closed);
  List_Precondition(Machine(Locks),lockdoor)==(dd: DOOR & position(dd) = closed);
  List_Precondition(Machine(Locks),quickclose)==(dd: DOOR & position(dd) = open)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Locks),quickclose)==(dd: DOOR & position(dd) = open & dd: DOOR | status:=status<+{dd|->locked} || position:=position<+{dd|->closed});
  Expanded_List_Substitution(Machine(Locks),lockdoor)==(dd: DOOR & position(dd) = closed | status:=status<+{dd|->locked});
  Expanded_List_Substitution(Machine(Locks),unlockdoor)==(dd: DOOR & position(dd) = closed | status:=status<+{dd|->unlocked});
  Expanded_List_Substitution(Machine(Locks),opendoor)==(dd: DOOR & status(dd) = unlocked & dd: DOOR | position:=position<+{dd|->open});
  List_Substitution(Machine(Locks),closedoor)==(position(dd):=closed);
  Expanded_List_Substitution(Machine(Locks),closedoor)==(dd: DOOR | position:=position<+{dd|->closed});
  List_Substitution(Machine(Locks),opendoor)==(opening(dd));
  List_Substitution(Machine(Locks),unlockdoor)==(status(dd):=unlocked);
  List_Substitution(Machine(Locks),lockdoor)==(status(dd):=locked);
  List_Substitution(Machine(Locks),quickclose)==(status(dd):=locked || closedoor(dd))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Locks))==(?);
  Inherited_List_Constants(Machine(Locks))==(?);
  List_Constants(Machine(Locks))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Locks),POSITION)==({open,closed});
  Context_List_Enumerated(Machine(Locks))==(?);
  Context_List_Defered(Machine(Locks))==(?);
  Context_List_Sets(Machine(Locks))==(?);
  List_Valuable_Sets(Machine(Locks))==(DOOR);
  Inherited_List_Enumerated(Machine(Locks))==(POSITION);
  Inherited_List_Defered(Machine(Locks))==(DOOR);
  Inherited_List_Sets(Machine(Locks))==(DOOR,POSITION);
  List_Enumerated(Machine(Locks))==(STATUS);
  List_Defered(Machine(Locks))==(?);
  List_Sets(Machine(Locks))==(STATUS);
  Set_Definition(Machine(Locks),DOOR)==(?);
  Set_Definition(Machine(Locks),STATUS)==({locked,unlocked})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Locks))==(?);
  Expanded_List_HiddenConstants(Machine(Locks))==(?);
  List_HiddenConstants(Machine(Locks))==(?);
  External_List_HiddenConstants(Machine(Locks))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Locks))==(btrue);
  Context_List_Properties(Machine(Locks))==(btrue);
  Inherited_List_Properties(Machine(Locks))==(DOOR: FIN(INTEGER) & not(DOOR = {}) & POSITION: FIN(INTEGER) & not(POSITION = {}));
  List_Properties(Machine(Locks))==(STATUS: FIN(INTEGER) & not(STATUS = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Locks),closedoor)==(?);
  List_ANY_Var(Machine(Locks),opendoor)==(?);
  List_ANY_Var(Machine(Locks),unlockdoor)==(?);
  List_ANY_Var(Machine(Locks),lockdoor)==(?);
  List_ANY_Var(Machine(Locks),quickclose)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Locks)) == (STATUS,locked,unlocked | DOOR,POSITION,open,closed | status | V,position | opendoor,unlockdoor,lockdoor,quickclose | closedoor | included(Machine(Doors)) | ? | Locks);
  List_Of_HiddenCst_Ids(Machine(Locks)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Locks)) == (?);
  List_Of_VisibleVar_Ids(Machine(Locks)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Locks)) == (?: ?);
  List_Of_Ids(Machine(Doors)) == (DOOR,POSITION,open,closed | ? | position | ? | opening,closedoor | ? | ? | ? | Doors);
  List_Of_HiddenCst_Ids(Machine(Doors)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Doors)) == (?);
  List_Of_VisibleVar_Ids(Machine(Doors)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Doors)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Locks)) == (Type(POSITION) == Cst(SetOf(etype(POSITION,0,1)));Type(DOOR) == Cst(SetOf(atype(DOOR,"[DOOR","]DOOR")));Type(STATUS) == Cst(SetOf(etype(STATUS,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Locks)) == (Type(closed) == Cst(etype(POSITION,0,1));Type(open) == Cst(etype(POSITION,0,1));Type(locked) == Cst(etype(STATUS,0,1));Type(unlocked) == Cst(etype(STATUS,0,1)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Locks)) == (Type(position) == Mvl(SetOf(atype(DOOR,"[DOOR","]DOOR")*etype(POSITION,0,1)));Type(status) == Mvl(SetOf(atype(DOOR,"[DOOR","]DOOR")*etype(STATUS,0,1))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Locks)) == (Type(closedoor) == Cst(No_type,atype(DOOR,?,?));Type(quickclose) == Cst(No_type,atype(DOOR,?,?));Type(lockdoor) == Cst(No_type,atype(DOOR,?,?));Type(unlockdoor) == Cst(No_type,atype(DOOR,?,?));Type(opendoor) == Cst(No_type,atype(DOOR,?,?)))
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
