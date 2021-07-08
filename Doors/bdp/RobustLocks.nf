Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(RobustLocks))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(RobustLocks))==(Machine(RobustLocks));
  Level(Machine(RobustLocks))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(RobustLocks)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(RobustLocks))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(RobustLocks))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(RobustLocks))==(Locks,Doors);
  List_Includes(Machine(RobustLocks))==(Locks)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(RobustLocks))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(RobustLocks))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(RobustLocks))==(?);
  Context_List_Variables(Machine(RobustLocks))==(?);
  Abstract_List_Variables(Machine(RobustLocks))==(?);
  Local_List_Variables(Machine(RobustLocks))==(?);
  List_Variables(Machine(RobustLocks))==(status,position);
  External_List_Variables(Machine(RobustLocks))==(status,position)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(RobustLocks))==(?);
  Abstract_List_VisibleVariables(Machine(RobustLocks))==(?);
  External_List_VisibleVariables(Machine(RobustLocks))==(?);
  Expanded_List_VisibleVariables(Machine(RobustLocks))==(?);
  List_VisibleVariables(Machine(RobustLocks))==(?);
  Internal_List_VisibleVariables(Machine(RobustLocks))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(RobustLocks))==(btrue);
  Gluing_List_Invariant(Machine(RobustLocks))==(btrue);
  Abstract_List_Invariant(Machine(RobustLocks))==(btrue);
  Expanded_List_Invariant(Machine(RobustLocks))==(status: DOOR --> STATUS & position~[{open}] <: status~[{unlocked}] & position: DOOR --> POSITION);
  Context_List_Invariant(Machine(RobustLocks))==(btrue);
  List_Invariant(Machine(RobustLocks))==(btrue)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(RobustLocks))==(btrue);
  Expanded_List_Assertions(Machine(RobustLocks))==(btrue);
  Context_List_Assertions(Machine(RobustLocks))==(btrue);
  List_Assertions(Machine(RobustLocks))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(RobustLocks))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(RobustLocks))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(RobustLocks))==(position:=DOOR*{closed};status:=DOOR*{locked});
  Context_List_Initialisation(Machine(RobustLocks))==(skip);
  List_Initialisation(Machine(RobustLocks))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(RobustLocks))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(RobustLocks),Machine(Locks))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(RobustLocks),Machine(Locks))==(btrue);
  List_Context_Constraints(Machine(RobustLocks))==(btrue);
  List_Constraints(Machine(RobustLocks))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(RobustLocks))==(robustopen,robustclose,robustunlock,robustlock);
  List_Operations(Machine(RobustLocks))==(robustopen,robustclose,robustunlock,robustlock)
END
&
THEORY ListInputX IS
  List_Input(Machine(RobustLocks),robustopen)==(dd);
  List_Input(Machine(RobustLocks),robustclose)==(dd);
  List_Input(Machine(RobustLocks),robustunlock)==(dd);
  List_Input(Machine(RobustLocks),robustlock)==(dd)
END
&
THEORY ListOutputX IS
  List_Output(Machine(RobustLocks),robustopen)==(ans);
  List_Output(Machine(RobustLocks),robustclose)==(ans);
  List_Output(Machine(RobustLocks),robustunlock)==(ans);
  List_Output(Machine(RobustLocks),robustlock)==(ans)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(RobustLocks),robustopen)==(ans <-- robustopen(dd));
  List_Header(Machine(RobustLocks),robustclose)==(ans <-- robustclose(dd));
  List_Header(Machine(RobustLocks),robustunlock)==(ans <-- robustunlock(dd));
  List_Header(Machine(RobustLocks),robustlock)==(ans <-- robustlock(dd))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(RobustLocks),robustopen)==(dd: DOOR);
  List_Precondition(Machine(RobustLocks),robustclose)==(dd: DOOR);
  List_Precondition(Machine(RobustLocks),robustunlock)==(dd: DOOR);
  List_Precondition(Machine(RobustLocks),robustlock)==(dd: DOOR)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(RobustLocks),robustlock)==(dd: DOOR | position(dd) = closed ==> (dd: DOOR & position(dd) = closed | status:=status<+{dd|->locked} || ans:=ok) [] not(position(dd) = closed) ==> ans:=error);
  Expanded_List_Substitution(Machine(RobustLocks),robustunlock)==(dd: DOOR | position(dd) = closed ==> (dd: DOOR & position(dd) = closed | status:=status<+{dd|->unlocked} || ans:=ok) [] not(position(dd) = closed) ==> ans:=error);
  Expanded_List_Substitution(Machine(RobustLocks),robustclose)==(dd: DOOR | position(dd) = open ==> (dd: DOOR & position(dd) = open | status:=status<+{dd|->locked} || position:=position<+{dd|->closed} || ans:=ok) [] not(position(dd) = open) ==> ans:=error);
  Expanded_List_Substitution(Machine(RobustLocks),robustopen)==(dd: DOOR | status(dd) = unlocked ==> (dd: DOOR & status(dd) = unlocked | position:=position<+{dd|->open} || ans:=ok) [] not(status(dd) = unlocked) ==> ans:=error);
  List_Substitution(Machine(RobustLocks),robustopen)==(IF status(dd) = unlocked THEN opendoor(dd) || ans:=ok ELSE ans:=error END);
  List_Substitution(Machine(RobustLocks),robustclose)==(IF position(dd) = open THEN quickclose(dd) || ans:=ok ELSE ans:=error END);
  List_Substitution(Machine(RobustLocks),robustunlock)==(IF position(dd) = closed THEN unlockdoor(dd) || ans:=ok ELSE ans:=error END);
  List_Substitution(Machine(RobustLocks),robustlock)==(IF position(dd) = closed THEN lockdoor(dd) || ans:=ok ELSE ans:=error END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(RobustLocks))==(?);
  Inherited_List_Constants(Machine(RobustLocks))==(?);
  List_Constants(Machine(RobustLocks))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(RobustLocks),POSITION)==({open,closed});
  Context_List_Enumerated(Machine(RobustLocks))==(?);
  Context_List_Defered(Machine(RobustLocks))==(?);
  Context_List_Sets(Machine(RobustLocks))==(?);
  List_Valuable_Sets(Machine(RobustLocks))==(DOOR);
  Inherited_List_Enumerated(Machine(RobustLocks))==(STATUS,POSITION);
  Inherited_List_Defered(Machine(RobustLocks))==(DOOR);
  Inherited_List_Sets(Machine(RobustLocks))==(STATUS,DOOR,POSITION);
  List_Enumerated(Machine(RobustLocks))==(REPORT);
  List_Defered(Machine(RobustLocks))==(?);
  List_Sets(Machine(RobustLocks))==(REPORT);
  Set_Definition(Machine(RobustLocks),STATUS)==({locked,unlocked});
  Set_Definition(Machine(RobustLocks),DOOR)==(?);
  Set_Definition(Machine(RobustLocks),REPORT)==({ok,error})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(RobustLocks))==(?);
  Expanded_List_HiddenConstants(Machine(RobustLocks))==(?);
  List_HiddenConstants(Machine(RobustLocks))==(?);
  External_List_HiddenConstants(Machine(RobustLocks))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(RobustLocks))==(btrue);
  Context_List_Properties(Machine(RobustLocks))==(btrue);
  Inherited_List_Properties(Machine(RobustLocks))==(STATUS: FIN(INTEGER) & not(STATUS = {}) & DOOR: FIN(INTEGER) & not(DOOR = {}) & POSITION: FIN(INTEGER) & not(POSITION = {}));
  List_Properties(Machine(RobustLocks))==(REPORT: FIN(INTEGER) & not(REPORT = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(RobustLocks),robustopen)==(?);
  List_ANY_Var(Machine(RobustLocks),robustclose)==(?);
  List_ANY_Var(Machine(RobustLocks),robustunlock)==(?);
  List_ANY_Var(Machine(RobustLocks),robustlock)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(RobustLocks)) == (REPORT,ok,error | STATUS,locked,unlocked,DOOR,POSITION,open,closed | ? | status,V,position | robustopen,robustclose,robustunlock,robustlock | ? | included(Machine(Locks)) | ? | RobustLocks);
  List_Of_HiddenCst_Ids(Machine(RobustLocks)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(RobustLocks)) == (?);
  List_Of_VisibleVar_Ids(Machine(RobustLocks)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(RobustLocks)) == (?: ?);
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
  Sets(Machine(RobustLocks)) == (Type(STATUS) == Cst(SetOf(etype(STATUS,0,1)));Type(DOOR) == Cst(SetOf(atype(DOOR,"[DOOR","]DOOR")));Type(POSITION) == Cst(SetOf(etype(POSITION,0,1)));Type(REPORT) == Cst(SetOf(etype(REPORT,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(RobustLocks)) == (Type(unlocked) == Cst(etype(STATUS,0,1));Type(locked) == Cst(etype(STATUS,0,1));Type(open) == Cst(etype(POSITION,0,1));Type(closed) == Cst(etype(POSITION,0,1));Type(ok) == Cst(etype(REPORT,0,1));Type(error) == Cst(etype(REPORT,0,1)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(RobustLocks)) == (Type(status) == Mvl(SetOf(atype(DOOR,"[DOOR","]DOOR")*etype(STATUS,0,1)));Type(position) == Mvl(SetOf(atype(DOOR,"[DOOR","]DOOR")*etype(POSITION,0,1))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(RobustLocks)) == (Type(robustlock) == Cst(etype(REPORT,?,?),atype(DOOR,?,?));Type(robustunlock) == Cst(etype(REPORT,?,?),atype(DOOR,?,?));Type(robustclose) == Cst(etype(REPORT,?,?),atype(DOOR,?,?));Type(robustopen) == Cst(etype(REPORT,?,?),atype(DOOR,?,?)))
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
