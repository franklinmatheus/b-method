Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(List))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(List))==(Machine(List));
  Level(Machine(List))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(List)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(List))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(List))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(List))==(?);
  List_Includes(Machine(List))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(List))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(List))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(List))==(?);
  Context_List_Variables(Machine(List))==(?);
  Abstract_List_Variables(Machine(List))==(?);
  Local_List_Variables(Machine(List))==(list);
  List_Variables(Machine(List))==(list);
  External_List_Variables(Machine(List))==(list)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(List))==(?);
  Abstract_List_VisibleVariables(Machine(List))==(?);
  External_List_VisibleVariables(Machine(List))==(?);
  Expanded_List_VisibleVariables(Machine(List))==(?);
  List_VisibleVariables(Machine(List))==(?);
  Internal_List_VisibleVariables(Machine(List))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(List))==(btrue);
  Gluing_List_Invariant(Machine(List))==(btrue);
  Expanded_List_Invariant(Machine(List))==(btrue);
  Abstract_List_Invariant(Machine(List))==(btrue);
  Context_List_Invariant(Machine(List))==(btrue);
  List_Invariant(Machine(List))==(list: seq(ELEMENT))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(List))==(btrue);
  Abstract_List_Assertions(Machine(List))==(btrue);
  Context_List_Assertions(Machine(List))==(btrue);
  List_Assertions(Machine(List))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(List))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(List))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(List))==(list:=<>);
  Context_List_Initialisation(Machine(List))==(skip);
  List_Initialisation(Machine(List))==(list:=<>)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(List))==(ELEMENT)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(List))==(btrue);
  List_Constraints(Machine(List))==(ELEMENT: FIN(INTEGER) & not(ELEMENT = {}))
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(List))==(add,take);
  List_Operations(Machine(List))==(add,take)
END
&
THEORY ListInputX IS
  List_Input(Machine(List),add)==(ee);
  List_Input(Machine(List),take)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(List),add)==(?);
  List_Output(Machine(List),take)==(ee)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(List),add)==(add(ee));
  List_Header(Machine(List),take)==(ee <-- take)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(List),add)==(ee: ELEMENT);
  List_Precondition(Machine(List),take)==(list/=<>)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(List),take)==(list/=<> | list,ee:=tail(list),first(list));
  Expanded_List_Substitution(Machine(List),add)==(ee: ELEMENT | list:=list<-ee);
  List_Substitution(Machine(List),add)==(list:=list<-ee);
  List_Substitution(Machine(List),take)==(list:=tail(list) || ee:=first(list))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(List))==(?);
  Inherited_List_Constants(Machine(List))==(?);
  List_Constants(Machine(List))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(List))==(?);
  Context_List_Defered(Machine(List))==(?);
  Context_List_Sets(Machine(List))==(?);
  List_Valuable_Sets(Machine(List))==(?);
  Inherited_List_Enumerated(Machine(List))==(?);
  Inherited_List_Defered(Machine(List))==(?);
  Inherited_List_Sets(Machine(List))==(?);
  List_Enumerated(Machine(List))==(?);
  List_Defered(Machine(List))==(?);
  List_Sets(Machine(List))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(List))==(?);
  Expanded_List_HiddenConstants(Machine(List))==(?);
  List_HiddenConstants(Machine(List))==(?);
  External_List_HiddenConstants(Machine(List))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(List))==(btrue);
  Context_List_Properties(Machine(List))==(btrue);
  Inherited_List_Properties(Machine(List))==(btrue);
  List_Properties(Machine(List))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(List),add)==(?);
  List_ANY_Var(Machine(List),take)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(List)) == (? | ? | list | ? | add,take | ? | ? | ELEMENT | List);
  List_Of_HiddenCst_Ids(Machine(List)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(List)) == (?);
  List_Of_VisibleVar_Ids(Machine(List)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(List)) == (?: ?)
END
&
THEORY ParametersEnvX IS
  Parameters(Machine(List)) == (Type(ELEMENT) == Prm(SetOf(atype(ELEMENT,?,?))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(List)) == (Type(list) == Mvl(SetOf(btype(INTEGER,?,?)*atype(ELEMENT,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(List)) == (Type(take) == Cst(atype(ELEMENT,?,?),No_type);Type(add) == Cst(No_type,atype(ELEMENT,?,?)))
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
