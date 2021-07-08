Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Testset))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Testset))==(Machine(Testset));
  Level(Machine(Testset))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Testset)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Testset))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Testset))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Testset))==(?);
  List_Includes(Machine(Testset))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Testset))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Testset))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Testset))==(?);
  Context_List_Variables(Machine(Testset))==(?);
  Abstract_List_Variables(Machine(Testset))==(?);
  Local_List_Variables(Machine(Testset))==(cross);
  List_Variables(Machine(Testset))==(cross);
  External_List_Variables(Machine(Testset))==(cross)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Testset))==(?);
  Abstract_List_VisibleVariables(Machine(Testset))==(?);
  External_List_VisibleVariables(Machine(Testset))==(?);
  Expanded_List_VisibleVariables(Machine(Testset))==(?);
  List_VisibleVariables(Machine(Testset))==(?);
  Internal_List_VisibleVariables(Machine(Testset))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Testset))==(btrue);
  Gluing_List_Invariant(Machine(Testset))==(btrue);
  Expanded_List_Invariant(Machine(Testset))==(btrue);
  Abstract_List_Invariant(Machine(Testset))==(btrue);
  Context_List_Invariant(Machine(Testset))==(btrue);
  List_Invariant(Machine(Testset))==(cross: SET1 <-> SET2)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Testset))==(btrue);
  Abstract_List_Assertions(Machine(Testset))==(btrue);
  Context_List_Assertions(Machine(Testset))==(btrue);
  List_Assertions(Machine(Testset))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Testset))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Testset))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Testset))==(cross:=SET1*SET2);
  Context_List_Initialisation(Machine(Testset))==(skip);
  List_Initialisation(Machine(Testset))==(cross:=SET1*SET2)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Testset))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Testset))==(btrue);
  List_Constraints(Machine(Testset))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Testset))==(get1);
  List_Operations(Machine(Testset))==(get1)
END
&
THEORY ListInputX IS
  List_Input(Machine(Testset),get1)==(ss)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Testset),get1)==(out)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Testset),get1)==(out <-- get1(ss))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Testset),get1)==(ss: SET2)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Testset),get1)==(ss: SET2 | out:=cross~[{ss}]);
  List_Substitution(Machine(Testset),get1)==(out:=cross~[{ss}])
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Testset))==(?);
  Inherited_List_Constants(Machine(Testset))==(?);
  List_Constants(Machine(Testset))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Testset),SET1)==(?);
  Context_List_Enumerated(Machine(Testset))==(?);
  Context_List_Defered(Machine(Testset))==(?);
  Context_List_Sets(Machine(Testset))==(?);
  List_Valuable_Sets(Machine(Testset))==(SET1,SET2);
  Inherited_List_Enumerated(Machine(Testset))==(?);
  Inherited_List_Defered(Machine(Testset))==(?);
  Inherited_List_Sets(Machine(Testset))==(?);
  List_Enumerated(Machine(Testset))==(?);
  List_Defered(Machine(Testset))==(SET1,SET2);
  List_Sets(Machine(Testset))==(SET1,SET2);
  Set_Definition(Machine(Testset),SET2)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Testset))==(?);
  Expanded_List_HiddenConstants(Machine(Testset))==(?);
  List_HiddenConstants(Machine(Testset))==(?);
  External_List_HiddenConstants(Machine(Testset))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Testset))==(btrue);
  Context_List_Properties(Machine(Testset))==(btrue);
  Inherited_List_Properties(Machine(Testset))==(btrue);
  List_Properties(Machine(Testset))==(SET1: FIN(INTEGER) & not(SET1 = {}) & SET2: FIN(INTEGER) & not(SET2 = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Testset),get1)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Testset)) == (SET1,SET2 | ? | cross | ? | get1 | ? | ? | ? | Testset);
  List_Of_HiddenCst_Ids(Machine(Testset)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Testset)) == (?);
  List_Of_VisibleVar_Ids(Machine(Testset)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Testset)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Testset)) == (Type(SET1) == Cst(SetOf(atype(SET1,"[SET1","]SET1")));Type(SET2) == Cst(SetOf(atype(SET2,"[SET2","]SET2"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Testset)) == (Type(cross) == Mvl(SetOf(atype(SET1,?,?)*atype(SET2,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Testset)) == (Type(get1) == Cst(SetOf(atype(SET1,?,?)),atype(SET2,?,?)));
  Observers(Machine(Testset)) == (Type(get1) == Cst(SetOf(atype(SET1,?,?)),atype(SET2,?,?)))
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
