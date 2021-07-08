Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Port))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Port))==(Machine(Port));
  Level(Machine(Port))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Port)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Port))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Port))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Port))==(?);
  List_Includes(Machine(Port))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Port))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Port))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Port))==(?);
  Context_List_Variables(Machine(Port))==(?);
  Abstract_List_Variables(Machine(Port))==(?);
  Local_List_Variables(Machine(Port))==(docked,waiting);
  List_Variables(Machine(Port))==(docked,waiting);
  External_List_Variables(Machine(Port))==(docked,waiting)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Port))==(?);
  Abstract_List_VisibleVariables(Machine(Port))==(?);
  External_List_VisibleVariables(Machine(Port))==(?);
  Expanded_List_VisibleVariables(Machine(Port))==(?);
  List_VisibleVariables(Machine(Port))==(?);
  Internal_List_VisibleVariables(Machine(Port))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Port))==(btrue);
  Gluing_List_Invariant(Machine(Port))==(btrue);
  Expanded_List_Invariant(Machine(Port))==(btrue);
  Abstract_List_Invariant(Machine(Port))==(btrue);
  Context_List_Invariant(Machine(Port))==(btrue);
  List_Invariant(Machine(Port))==(waiting: iseq(SHIP) & docked: QUAY >+> SHIP & ran(waiting)/\ran(docked) = {})
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Port))==(btrue);
  Abstract_List_Assertions(Machine(Port))==(btrue);
  Context_List_Assertions(Machine(Port))==(btrue);
  List_Assertions(Machine(Port))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Port))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Port))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Port))==(waiting,docked:=<>,{});
  Context_List_Initialisation(Machine(Port))==(skip);
  List_Initialisation(Machine(Port))==(waiting:=<> || docked:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Port))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Port))==(btrue);
  List_Constraints(Machine(Port))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Port))==(arrive,dock,leave,numberwaiting,jumpqueue);
  List_Operations(Machine(Port))==(arrive,dock,leave,numberwaiting,jumpqueue)
END
&
THEORY ListInputX IS
  List_Input(Machine(Port),arrive)==(ss);
  List_Input(Machine(Port),dock)==(qq);
  List_Input(Machine(Port),leave)==(ss);
  List_Input(Machine(Port),numberwaiting)==(?);
  List_Input(Machine(Port),jumpqueue)==(ss,qq)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Port),arrive)==(?);
  List_Output(Machine(Port),dock)==(?);
  List_Output(Machine(Port),leave)==(qq);
  List_Output(Machine(Port),numberwaiting)==(nn);
  List_Output(Machine(Port),jumpqueue)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Port),arrive)==(arrive(ss));
  List_Header(Machine(Port),dock)==(dock(qq));
  List_Header(Machine(Port),leave)==(qq <-- leave(ss));
  List_Header(Machine(Port),numberwaiting)==(nn <-- numberwaiting);
  List_Header(Machine(Port),jumpqueue)==(jumpqueue(ss,qq))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Port),arrive)==(ss: SHIP & ss/:ran(waiting) & ss/:ran(docked) & card(waiting)<MAXINT);
  List_Precondition(Machine(Port),dock)==(waiting/=<> & qq: QUAY & qq/:dom(docked));
  List_Precondition(Machine(Port),leave)==(ss: SHIP & ss: ran(docked));
  List_Precondition(Machine(Port),numberwaiting)==(btrue);
  List_Precondition(Machine(Port),jumpqueue)==(ss: SHIP & ss/:ran(docked) & ss/:ran(waiting) & qq: QUAY & qq/:dom(docked))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Port),jumpqueue)==(ss: SHIP & ss/:ran(docked) & ss/:ran(waiting) & qq: QUAY & qq/:dom(docked) | docked:=docked<+{qq|->ss});
  Expanded_List_Substitution(Machine(Port),numberwaiting)==(btrue | nn:=size(waiting));
  Expanded_List_Substitution(Machine(Port),leave)==(ss: SHIP & ss: ran(docked) | docked,qq:=docked|>>{ss},docked~(ss));
  Expanded_List_Substitution(Machine(Port),dock)==(waiting/=<> & qq: QUAY & qq/:dom(docked) | waiting,docked:=tail(waiting),docked<+{qq|->first(waiting)});
  Expanded_List_Substitution(Machine(Port),arrive)==(ss: SHIP & ss/:ran(waiting) & ss/:ran(docked) & card(waiting)<MAXINT | waiting:=waiting<-ss);
  List_Substitution(Machine(Port),arrive)==(waiting:=waiting<-ss);
  List_Substitution(Machine(Port),dock)==(waiting:=tail(waiting) || docked(qq):=first(waiting));
  List_Substitution(Machine(Port),leave)==(docked:=docked|>>{ss} || qq:=docked~(ss));
  List_Substitution(Machine(Port),numberwaiting)==(nn:=size(waiting));
  List_Substitution(Machine(Port),jumpqueue)==(docked(qq):=ss)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Port))==(?);
  Inherited_List_Constants(Machine(Port))==(?);
  List_Constants(Machine(Port))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Port),SHIP)==(?);
  Context_List_Enumerated(Machine(Port))==(?);
  Context_List_Defered(Machine(Port))==(?);
  Context_List_Sets(Machine(Port))==(?);
  List_Valuable_Sets(Machine(Port))==(SHIP,QUAY);
  Inherited_List_Enumerated(Machine(Port))==(?);
  Inherited_List_Defered(Machine(Port))==(?);
  Inherited_List_Sets(Machine(Port))==(?);
  List_Enumerated(Machine(Port))==(?);
  List_Defered(Machine(Port))==(SHIP,QUAY);
  List_Sets(Machine(Port))==(SHIP,QUAY);
  Set_Definition(Machine(Port),QUAY)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Port))==(?);
  Expanded_List_HiddenConstants(Machine(Port))==(?);
  List_HiddenConstants(Machine(Port))==(?);
  External_List_HiddenConstants(Machine(Port))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Port))==(btrue);
  Context_List_Properties(Machine(Port))==(btrue);
  Inherited_List_Properties(Machine(Port))==(btrue);
  List_Properties(Machine(Port))==(SHIP: FIN(INTEGER) & not(SHIP = {}) & QUAY: FIN(INTEGER) & not(QUAY = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Port),arrive)==(?);
  List_ANY_Var(Machine(Port),dock)==(?);
  List_ANY_Var(Machine(Port),leave)==(?);
  List_ANY_Var(Machine(Port),numberwaiting)==(?);
  List_ANY_Var(Machine(Port),jumpqueue)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Port)) == (SHIP,QUAY | ? | docked,waiting | ? | arrive,dock,leave,numberwaiting,jumpqueue | ? | ? | ? | Port);
  List_Of_HiddenCst_Ids(Machine(Port)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Port)) == (?);
  List_Of_VisibleVar_Ids(Machine(Port)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Port)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Port)) == (Type(SHIP) == Cst(SetOf(atype(SHIP,"[SHIP","]SHIP")));Type(QUAY) == Cst(SetOf(atype(QUAY,"[QUAY","]QUAY"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Port)) == (Type(docked) == Mvl(SetOf(atype(QUAY,?,?)*atype(SHIP,?,?)));Type(waiting) == Mvl(SetOf(btype(INTEGER,?,?)*atype(SHIP,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Port)) == (Type(jumpqueue) == Cst(No_type,atype(SHIP,?,?)*atype(QUAY,?,?));Type(numberwaiting) == Cst(btype(INTEGER,?,?),No_type);Type(leave) == Cst(atype(QUAY,?,?),atype(SHIP,?,?));Type(dock) == Cst(No_type,atype(QUAY,?,?));Type(arrive) == Cst(No_type,atype(SHIP,?,?)));
  Observers(Machine(Port)) == (Type(numberwaiting) == Cst(btype(INTEGER,?,?),No_type))
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
