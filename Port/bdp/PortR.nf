Normalised(
THEORY MagicNumberX IS
  MagicNumber(Refinement(PortR))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Refinement(PortR))==(Machine(Port));
  Level(Refinement(PortR))==(1);
  Upper_Level(Refinement(PortR))==(Machine(Port))
END
&
THEORY LoadedStructureX IS
  Refinement(PortR)
END
&
THEORY ListSeesX IS
  List_Sees(Refinement(PortR))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Refinement(PortR))==(Map,List);
  List_Includes(Refinement(PortR))==(List,Map)
END
&
THEORY ListPromotesX IS
  List_Promotes(Refinement(PortR))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Refinement(PortR))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Refinement(PortR))==(?);
  Context_List_Variables(Refinement(PortR))==(?);
  Abstract_List_Variables(Refinement(PortR))==(docked,waiting);
  Local_List_Variables(Refinement(PortR))==(num);
  List_Variables(Refinement(PortR))==(num,list,fun);
  External_List_Variables(Refinement(PortR))==(num,list,fun)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Refinement(PortR))==(?);
  Abstract_List_VisibleVariables(Refinement(PortR))==(?);
  External_List_VisibleVariables(Refinement(PortR))==(?);
  Expanded_List_VisibleVariables(Refinement(PortR))==(?);
  List_VisibleVariables(Refinement(PortR))==(?);
  Internal_List_VisibleVariables(Refinement(PortR))==(?)
END
&
THEORY ListOfNewVariablesX IS
  List_Of_New_Variables(Refinement(PortR))==(num)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Refinement(PortR))==(btrue);
  Abstract_List_Invariant(Refinement(PortR))==(waiting: iseq(SHIP) & docked: QUAY >+> SHIP & ran(waiting)/\ran(docked) = {});
  Expanded_List_Invariant(Refinement(PortR))==(list: seq(SHIP) & fun: SHIP +-> QUAY);
  Context_List_Invariant(Refinement(PortR))==(btrue);
  List_Invariant(Refinement(PortR))==(num: NAT & num = size(waiting) & waiting = list & docked~ = fun)
END
&
THEORY ListVariantX IS
  List_Variant(Refinement(PortR))==(0)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Refinement(PortR))==(btrue);
  Expanded_List_Assertions(Refinement(PortR))==(btrue);
  Context_List_Assertions(Refinement(PortR))==(btrue);
  List_Assertions(Refinement(PortR))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Refinement(PortR))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Refinement(PortR))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Refinement(PortR))==(list:=<>;fun:={};num:=0);
  Context_List_Initialisation(Refinement(PortR))==(skip);
  List_Initialisation(Refinement(PortR))==(num:=0)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Refinement(PortR))==(arrive,dock,leave,numberwaiting,jumpqueue);
  List_Operations(Refinement(PortR))==(arrive,dock,leave,numberwaiting,jumpqueue)
END
&
THEORY ListInputX IS
  List_Input(Refinement(PortR),arrive)==(ss);
  List_Input(Refinement(PortR),dock)==(qq);
  List_Input(Refinement(PortR),leave)==(ss);
  List_Input(Refinement(PortR),numberwaiting)==(?);
  List_Input(Refinement(PortR),jumpqueue)==(ss,qq)
END
&
THEORY ListOutputX IS
  List_Output(Refinement(PortR),arrive)==(?);
  List_Output(Refinement(PortR),dock)==(?);
  List_Output(Refinement(PortR),leave)==(qq);
  List_Output(Refinement(PortR),numberwaiting)==(nn);
  List_Output(Refinement(PortR),jumpqueue)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Refinement(PortR),arrive)==(arrive(ss));
  List_Header(Refinement(PortR),dock)==(dock(qq));
  List_Header(Refinement(PortR),leave)==(qq <-- leave(ss));
  List_Header(Refinement(PortR),numberwaiting)==(nn <-- numberwaiting);
  List_Header(Refinement(PortR),jumpqueue)==(jumpqueue(ss,qq))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Refinement(PortR),arrive)==(btrue);
  List_Precondition(Refinement(PortR),arrive)==(ss: SHIP & ss/:ran(waiting) & ss/:ran(docked) & card(waiting)<MAXINT);
  Own_Precondition(Refinement(PortR),dock)==(btrue);
  List_Precondition(Refinement(PortR),dock)==(waiting/=<> & qq: QUAY & qq/:dom(docked));
  Own_Precondition(Refinement(PortR),leave)==(btrue);
  List_Precondition(Refinement(PortR),leave)==(ss: SHIP & ss: ran(docked));
  Own_Precondition(Refinement(PortR),numberwaiting)==(btrue);
  List_Precondition(Refinement(PortR),numberwaiting)==(btrue);
  Own_Precondition(Refinement(PortR),jumpqueue)==(btrue);
  List_Precondition(Refinement(PortR),jumpqueue)==(ss: SHIP & ss/:ran(docked) & ss/:ran(waiting) & qq: QUAY & qq/:dom(docked))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Refinement(PortR),jumpqueue)==(ss: SHIP & ss/:ran(docked) & ss/:ran(waiting) & qq: QUAY & qq/:dom(docked) & ss: SHIP & qq: QUAY | fun:=fun<+{ss|->qq});
  Expanded_List_Substitution(Refinement(PortR),numberwaiting)==(btrue | nn:=num);
  Expanded_List_Substitution(Refinement(PortR),leave)==(ss: SHIP & ss: ran(docked) | (ss: dom(fun) | qq:=fun(ss));(ss: SHIP | fun:={ss}<<|fun));
  Expanded_List_Substitution(Refinement(PortR),dock)==(waiting/=<> & qq: QUAY & qq/:dom(docked) | @sh.((list/=<> | list,sh:=tail(list),first(list));(sh: SHIP & qq: QUAY | fun:=fun<+{sh|->qq}));num:=num-1);
  Expanded_List_Substitution(Refinement(PortR),arrive)==(ss: SHIP & ss/:ran(waiting) & ss/:ran(docked) & card(waiting)<MAXINT | (ss: SHIP | list:=list<-ss);num:=num+1);
  List_Substitution(Refinement(PortR),arrive)==(add(ss);num:=num+1);
  List_Substitution(Refinement(PortR),dock)==(VAR sh IN sh <-- take;insert(sh,qq) END;num:=num-1);
  List_Substitution(Refinement(PortR),leave)==(qq <-- query(ss);remove(ss));
  List_Substitution(Refinement(PortR),numberwaiting)==(nn:=num);
  List_Substitution(Refinement(PortR),jumpqueue)==(insert(ss,qq))
END
&
THEORY ListParametersX IS
  List_Parameters(Refinement(PortR))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Refinement(PortR),Machine(List))==(SHIP);
  List_Instanciated_Parameters(Refinement(PortR),Machine(Map))==(SHIP,QUAY)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Refinement(PortR),Machine(Map))==(SHIP: FIN(INTEGER) & not(SHIP = {}) & QUAY: FIN(INTEGER) & not(QUAY = {}));
  List_Constraints(Refinement(PortR))==(btrue);
  List_Context_Constraints(Refinement(PortR))==(btrue);
  List_Constraints(Refinement(PortR),Machine(List))==(SHIP: FIN(INTEGER) & not(SHIP = {}))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Refinement(PortR))==(?);
  Inherited_List_Constants(Refinement(PortR))==(?);
  List_Constants(Refinement(PortR))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Refinement(PortR),QUAY)==(?);
  Context_List_Enumerated(Refinement(PortR))==(?);
  Context_List_Defered(Refinement(PortR))==(?);
  Context_List_Sets(Refinement(PortR))==(?);
  List_Valuable_Sets(Refinement(PortR))==(SHIP,QUAY);
  Inherited_List_Enumerated(Refinement(PortR))==(?);
  Inherited_List_Defered(Refinement(PortR))==(SHIP,QUAY);
  Inherited_List_Sets(Refinement(PortR))==(SHIP,QUAY);
  List_Enumerated(Refinement(PortR))==(?);
  List_Defered(Refinement(PortR))==(?);
  List_Sets(Refinement(PortR))==(?);
  Set_Definition(Refinement(PortR),SHIP)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Refinement(PortR))==(?);
  Expanded_List_HiddenConstants(Refinement(PortR))==(?);
  List_HiddenConstants(Refinement(PortR))==(?);
  External_List_HiddenConstants(Refinement(PortR))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Refinement(PortR))==(SHIP: FIN(INTEGER) & not(SHIP = {}) & QUAY: FIN(INTEGER) & not(QUAY = {}));
  Context_List_Properties(Refinement(PortR))==(btrue);
  Inherited_List_Properties(Refinement(PortR))==(btrue);
  List_Properties(Refinement(PortR))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Refinement(PortR),arrive)==(?);
  List_ANY_Var(Refinement(PortR),dock)==(?);
  List_ANY_Var(Refinement(PortR),leave)==(?);
  List_ANY_Var(Refinement(PortR),numberwaiting)==(?);
  List_ANY_Var(Refinement(PortR),jumpqueue)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Refinement(PortR)) == (? | ? | num | fun,list | arrive,dock,leave,numberwaiting,jumpqueue | ? | included(Machine(List)),included(Machine(Map)) | ? | PortR);
  List_Of_HiddenCst_Ids(Refinement(PortR)) == (? | ?);
  List_Of_VisibleCst_Ids(Refinement(PortR)) == (?);
  List_Of_VisibleVar_Ids(Refinement(PortR)) == (? | ?);
  List_Of_Ids_SeenBNU(Refinement(PortR)) == (?: ?);
  List_Of_Ids(Machine(Map)) == (? | ? | fun | ? | insert,remove,query | ? | ? | INDEX,ITEM | Map);
  List_Of_HiddenCst_Ids(Machine(Map)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Map)) == (?);
  List_Of_VisibleVar_Ids(Machine(Map)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Map)) == (?: ?);
  List_Of_Ids(Machine(List)) == (? | ? | list | ? | add,take | ? | ? | ELEMENT | List);
  List_Of_HiddenCst_Ids(Machine(List)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(List)) == (?);
  List_Of_VisibleVar_Ids(Machine(List)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(List)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Refinement(PortR)) == (Type(QUAY) == Cst(SetOf(atype(QUAY,"[QUAY","]QUAY")));Type(SHIP) == Cst(SetOf(atype(SHIP,"[SHIP","]SHIP"))))
END
&
THEORY VariablesEnvX IS
  Variables(Refinement(PortR)) == (Type(list) == Mvl(SetOf(btype(INTEGER,?,?)*atype(SHIP,"[SHIP","]SHIP")));Type(fun) == Mvl(SetOf(atype(SHIP,"[SHIP","]SHIP")*atype(QUAY,"[QUAY","]QUAY")));Type(num) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Refinement(PortR)) == (Type(jumpqueue) == Cst(No_type,atype(SHIP,?,?)*atype(QUAY,?,?));Type(numberwaiting) == Cst(btype(INTEGER,?,?),No_type);Type(leave) == Cst(atype(QUAY,?,?),atype(SHIP,?,?));Type(dock) == Cst(No_type,atype(QUAY,?,?));Type(arrive) == Cst(No_type,atype(SHIP,?,?)))
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
