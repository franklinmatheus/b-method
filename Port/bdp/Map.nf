Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Map))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Map))==(Machine(Map));
  Level(Machine(Map))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Map)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Map))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Map))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Map))==(?);
  List_Includes(Machine(Map))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Map))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Map))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Map))==(?);
  Context_List_Variables(Machine(Map))==(?);
  Abstract_List_Variables(Machine(Map))==(?);
  Local_List_Variables(Machine(Map))==(fun);
  List_Variables(Machine(Map))==(fun);
  External_List_Variables(Machine(Map))==(fun)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Map))==(?);
  Abstract_List_VisibleVariables(Machine(Map))==(?);
  External_List_VisibleVariables(Machine(Map))==(?);
  Expanded_List_VisibleVariables(Machine(Map))==(?);
  List_VisibleVariables(Machine(Map))==(?);
  Internal_List_VisibleVariables(Machine(Map))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Map))==(btrue);
  Gluing_List_Invariant(Machine(Map))==(btrue);
  Expanded_List_Invariant(Machine(Map))==(btrue);
  Abstract_List_Invariant(Machine(Map))==(btrue);
  Context_List_Invariant(Machine(Map))==(btrue);
  List_Invariant(Machine(Map))==(fun: INDEX +-> ITEM)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Map))==(btrue);
  Abstract_List_Assertions(Machine(Map))==(btrue);
  Context_List_Assertions(Machine(Map))==(btrue);
  List_Assertions(Machine(Map))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Map))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Map))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Map))==(fun:={});
  Context_List_Initialisation(Machine(Map))==(skip);
  List_Initialisation(Machine(Map))==(fun:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Map))==(INDEX,ITEM)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Map))==(btrue);
  List_Constraints(Machine(Map))==(INDEX: FIN(INTEGER) & not(INDEX = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}))
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Map))==(insert,remove,query);
  List_Operations(Machine(Map))==(insert,remove,query)
END
&
THEORY ListInputX IS
  List_Input(Machine(Map),insert)==(ss1,ss2);
  List_Input(Machine(Map),remove)==(ss1);
  List_Input(Machine(Map),query)==(ss1)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Map),insert)==(?);
  List_Output(Machine(Map),remove)==(?);
  List_Output(Machine(Map),query)==(ss2)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Map),insert)==(insert(ss1,ss2));
  List_Header(Machine(Map),remove)==(remove(ss1));
  List_Header(Machine(Map),query)==(ss2 <-- query(ss1))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Map),insert)==(ss1: INDEX & ss2: ITEM);
  List_Precondition(Machine(Map),remove)==(ss1: INDEX);
  List_Precondition(Machine(Map),query)==(ss1: dom(fun))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Map),query)==(ss1: dom(fun) | ss2:=fun(ss1));
  Expanded_List_Substitution(Machine(Map),remove)==(ss1: INDEX | fun:={ss1}<<|fun);
  Expanded_List_Substitution(Machine(Map),insert)==(ss1: INDEX & ss2: ITEM | fun:=fun<+{ss1|->ss2});
  List_Substitution(Machine(Map),insert)==(fun(ss1):=ss2);
  List_Substitution(Machine(Map),remove)==(fun:={ss1}<<|fun);
  List_Substitution(Machine(Map),query)==(ss2:=fun(ss1))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Map))==(?);
  Inherited_List_Constants(Machine(Map))==(?);
  List_Constants(Machine(Map))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Map))==(?);
  Context_List_Defered(Machine(Map))==(?);
  Context_List_Sets(Machine(Map))==(?);
  List_Valuable_Sets(Machine(Map))==(?);
  Inherited_List_Enumerated(Machine(Map))==(?);
  Inherited_List_Defered(Machine(Map))==(?);
  Inherited_List_Sets(Machine(Map))==(?);
  List_Enumerated(Machine(Map))==(?);
  List_Defered(Machine(Map))==(?);
  List_Sets(Machine(Map))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Map))==(?);
  Expanded_List_HiddenConstants(Machine(Map))==(?);
  List_HiddenConstants(Machine(Map))==(?);
  External_List_HiddenConstants(Machine(Map))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Map))==(btrue);
  Context_List_Properties(Machine(Map))==(btrue);
  Inherited_List_Properties(Machine(Map))==(btrue);
  List_Properties(Machine(Map))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Map),insert)==(?);
  List_ANY_Var(Machine(Map),remove)==(?);
  List_ANY_Var(Machine(Map),query)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Map)) == (? | ? | fun | ? | insert,remove,query | ? | ? | INDEX,ITEM | Map);
  List_Of_HiddenCst_Ids(Machine(Map)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Map)) == (?);
  List_Of_VisibleVar_Ids(Machine(Map)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Map)) == (?: ?)
END
&
THEORY ParametersEnvX IS
  Parameters(Machine(Map)) == (Type(ITEM) == Prm(SetOf(atype(ITEM,?,?)));Type(INDEX) == Prm(SetOf(atype(INDEX,?,?))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Map)) == (Type(fun) == Mvl(SetOf(atype(INDEX,?,?)*atype(ITEM,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Map)) == (Type(query) == Cst(atype(ITEM,?,?),atype(INDEX,?,?));Type(remove) == Cst(No_type,atype(INDEX,?,?));Type(insert) == Cst(No_type,atype(INDEX,?,?)*atype(ITEM,?,?)));
  Observers(Machine(Map)) == (Type(query) == Cst(atype(ITEM,?,?),atype(INDEX,?,?)))
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
