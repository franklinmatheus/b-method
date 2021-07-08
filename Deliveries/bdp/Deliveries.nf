Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Deliveries))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Deliveries))==(Machine(Deliveries));
  Level(Machine(Deliveries))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Deliveries)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Deliveries))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Deliveries))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Deliveries))==(?);
  List_Includes(Machine(Deliveries))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Deliveries))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Deliveries))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Deliveries))==(?);
  Context_List_Variables(Machine(Deliveries))==(?);
  Abstract_List_Variables(Machine(Deliveries))==(?);
  Local_List_Variables(Machine(Deliveries))==(requests,nogo);
  List_Variables(Machine(Deliveries))==(requests,nogo);
  External_List_Variables(Machine(Deliveries))==(requests,nogo)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Deliveries))==(?);
  Abstract_List_VisibleVariables(Machine(Deliveries))==(?);
  External_List_VisibleVariables(Machine(Deliveries))==(?);
  Expanded_List_VisibleVariables(Machine(Deliveries))==(?);
  List_VisibleVariables(Machine(Deliveries))==(?);
  Internal_List_VisibleVariables(Machine(Deliveries))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Deliveries))==(btrue);
  Gluing_List_Invariant(Machine(Deliveries))==(btrue);
  Expanded_List_Invariant(Machine(Deliveries))==(btrue);
  Abstract_List_Invariant(Machine(Deliveries))==(btrue);
  Context_List_Invariant(Machine(Deliveries))==(btrue);
  List_Invariant(Machine(Deliveries))==(nogo <: ADDRESS & nogo: FIN(nogo) & requests: ITEM +-> ADDRESS & requests: FIN(requests))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Deliveries))==(btrue);
  Abstract_List_Assertions(Machine(Deliveries))==(btrue);
  Context_List_Assertions(Machine(Deliveries))==(btrue);
  List_Assertions(Machine(Deliveries))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Deliveries))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Deliveries))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Deliveries))==(@aa.(aa <: ADDRESS & aa: FIN(aa) & card(aa)<5 ==> nogo:=aa) || requests:={});
  Context_List_Initialisation(Machine(Deliveries))==(skip);
  List_Initialisation(Machine(Deliveries))==(ANY aa WHERE aa <: ADDRESS & aa: FIN(aa) & card(aa)<5 THEN nogo:=aa END || requests:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Deliveries))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Deliveries))==(btrue);
  List_Constraints(Machine(Deliveries))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Deliveries))==(load,drop,endofday,warning);
  List_Operations(Machine(Deliveries))==(load,drop,endofday,warning)
END
&
THEORY ListInputX IS
  List_Input(Machine(Deliveries),load)==(aa,ii);
  List_Input(Machine(Deliveries),drop)==(?);
  List_Input(Machine(Deliveries),endofday)==(?);
  List_Input(Machine(Deliveries),warning)==(aa)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Deliveries),load)==(?);
  List_Output(Machine(Deliveries),drop)==(oa,oi);
  List_Output(Machine(Deliveries),endofday)==(?);
  List_Output(Machine(Deliveries),warning)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Deliveries),load)==(load(aa,ii));
  List_Header(Machine(Deliveries),drop)==(oa,oi <-- drop);
  List_Header(Machine(Deliveries),endofday)==(endofday);
  List_Header(Machine(Deliveries),warning)==(warning(aa))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Deliveries),load)==(ii: ITEM & aa: ADDRESS & aa/:nogo);
  List_Precondition(Machine(Deliveries),drop)==(not(card(requests) = 0));
  List_Precondition(Machine(Deliveries),endofday)==(TRUE = TRUE);
  List_Precondition(Machine(Deliveries),warning)==(aa: ADDRESS)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Deliveries),warning)==(aa: ADDRESS | aa: nogo ==> requests:=requests|>>{aa} [] aa: nogo ==> nogo:=nogo-{aa} [] aa/:nogo & card(requests~[{aa}]) = 0 ==> nogo:=nogo\/{aa});
  Expanded_List_Substitution(Machine(Deliveries),endofday)==(TRUE = TRUE | @oo.(oo: 0..1 ==> (oo = 0 ==> requests:={} [] oo = 1 ==> requests:=requests)));
  Expanded_List_Substitution(Machine(Deliveries),drop)==(not(card(requests) = 0) | @(ii,aa).(ii: ITEM & aa: ADDRESS & ii|->aa: requests ==> requests,oa,oi:=requests-{ii|->aa},aa,ii));
  Expanded_List_Substitution(Machine(Deliveries),load)==(ii: ITEM & aa: ADDRESS & aa/:nogo | requests:={ii|->aa});
  List_Substitution(Machine(Deliveries),load)==(requests:={ii|->aa});
  List_Substitution(Machine(Deliveries),drop)==(ANY ii,aa WHERE ii: ITEM & aa: ADDRESS & ii|->aa: requests THEN requests:=requests-{ii|->aa} || oa:=aa || oi:=ii END);
  List_Substitution(Machine(Deliveries),endofday)==(ANY oo WHERE oo: 0..1 THEN SELECT oo = 0 THEN requests:={} WHEN oo = 1 THEN requests:=requests END END);
  List_Substitution(Machine(Deliveries),warning)==(SELECT aa: nogo THEN requests:=requests|>>{aa} WHEN aa: nogo THEN nogo:=nogo-{aa} WHEN aa/:nogo & card(requests~[{aa}]) = 0 THEN nogo:=nogo\/{aa} END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Deliveries))==(?);
  Inherited_List_Constants(Machine(Deliveries))==(?);
  List_Constants(Machine(Deliveries))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Deliveries),ADDRESS)==(?);
  Context_List_Enumerated(Machine(Deliveries))==(?);
  Context_List_Defered(Machine(Deliveries))==(?);
  Context_List_Sets(Machine(Deliveries))==(?);
  List_Valuable_Sets(Machine(Deliveries))==(ADDRESS,ITEM);
  Inherited_List_Enumerated(Machine(Deliveries))==(?);
  Inherited_List_Defered(Machine(Deliveries))==(?);
  Inherited_List_Sets(Machine(Deliveries))==(?);
  List_Enumerated(Machine(Deliveries))==(?);
  List_Defered(Machine(Deliveries))==(ADDRESS,ITEM);
  List_Sets(Machine(Deliveries))==(ADDRESS,ITEM);
  Set_Definition(Machine(Deliveries),ITEM)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Deliveries))==(?);
  Expanded_List_HiddenConstants(Machine(Deliveries))==(?);
  List_HiddenConstants(Machine(Deliveries))==(?);
  External_List_HiddenConstants(Machine(Deliveries))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Deliveries))==(btrue);
  Context_List_Properties(Machine(Deliveries))==(btrue);
  Inherited_List_Properties(Machine(Deliveries))==(btrue);
  List_Properties(Machine(Deliveries))==(ADDRESS: FIN(INTEGER) & not(ADDRESS = {}) & ITEM: FIN(INTEGER) & not(ITEM = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Deliveries),?)==(Var(aa) == SetOf(atype(ADDRESS,?,?)));
  List_ANY_Var(Machine(Deliveries),load)==(?);
  List_ANY_Var(Machine(Deliveries),drop)==((Var(ii) == atype(ITEM,?,?)),(Var(aa) == atype(ADDRESS,?,?)));
  List_ANY_Var(Machine(Deliveries),endofday)==(Var(oo) == btype(INTEGER,?,?));
  List_ANY_Var(Machine(Deliveries),warning)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Deliveries)) == (ADDRESS,ITEM | ? | requests,nogo | ? | load,drop,endofday,warning | ? | ? | ? | Deliveries);
  List_Of_HiddenCst_Ids(Machine(Deliveries)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Deliveries)) == (?);
  List_Of_VisibleVar_Ids(Machine(Deliveries)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Deliveries)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Deliveries)) == (Type(ADDRESS) == Cst(SetOf(atype(ADDRESS,"[ADDRESS","]ADDRESS")));Type(ITEM) == Cst(SetOf(atype(ITEM,"[ITEM","]ITEM"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Deliveries)) == (Type(requests) == Mvl(SetOf(atype(ITEM,?,?)*atype(ADDRESS,?,?)));Type(nogo) == Mvl(SetOf(atype(ADDRESS,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Deliveries)) == (Type(warning) == Cst(No_type,atype(ADDRESS,?,?));Type(endofday) == Cst(No_type,No_type);Type(drop) == Cst(atype(ADDRESS,?,?)*atype(ITEM,?,?),No_type);Type(load) == Cst(No_type,atype(ADDRESS,?,?)*atype(ITEM,?,?)))
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
