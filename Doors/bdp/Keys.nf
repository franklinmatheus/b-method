Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Keys))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Keys))==(Machine(Keys));
  Level(Machine(Keys))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Keys)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Keys))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Keys))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Keys))==(?);
  List_Includes(Machine(Keys))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Keys))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Keys))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Keys))==(?);
  Context_List_Variables(Machine(Keys))==(?);
  Abstract_List_Variables(Machine(Keys))==(?);
  Local_List_Variables(Machine(Keys))==(keys);
  List_Variables(Machine(Keys))==(keys);
  External_List_Variables(Machine(Keys))==(keys)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Keys))==(?);
  Abstract_List_VisibleVariables(Machine(Keys))==(?);
  External_List_VisibleVariables(Machine(Keys))==(?);
  Expanded_List_VisibleVariables(Machine(Keys))==(?);
  List_VisibleVariables(Machine(Keys))==(?);
  Internal_List_VisibleVariables(Machine(Keys))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Keys))==(btrue);
  Gluing_List_Invariant(Machine(Keys))==(btrue);
  Expanded_List_Invariant(Machine(Keys))==(btrue);
  Abstract_List_Invariant(Machine(Keys))==(btrue);
  Context_List_Invariant(Machine(Keys))==(btrue);
  List_Invariant(Machine(Keys))==(keys <: KEY)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Keys))==(btrue);
  Abstract_List_Assertions(Machine(Keys))==(btrue);
  Context_List_Assertions(Machine(Keys))==(btrue);
  List_Assertions(Machine(Keys))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Keys))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Keys))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Keys))==(keys:={});
  Context_List_Initialisation(Machine(Keys))==(skip);
  List_Initialisation(Machine(Keys))==(keys:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Keys))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Keys))==(btrue);
  List_Constraints(Machine(Keys))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Keys))==(insertkey,removekey);
  List_Operations(Machine(Keys))==(insertkey,removekey)
END
&
THEORY ListInputX IS
  List_Input(Machine(Keys),insertkey)==(kk);
  List_Input(Machine(Keys),removekey)==(kk)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Keys),insertkey)==(?);
  List_Output(Machine(Keys),removekey)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Keys),insertkey)==(insertkey(kk));
  List_Header(Machine(Keys),removekey)==(removekey(kk))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Keys),insertkey)==(kk: KEY);
  List_Precondition(Machine(Keys),removekey)==(kk: KEY)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Keys),removekey)==(kk: KEY | keys:=keys-{kk});
  Expanded_List_Substitution(Machine(Keys),insertkey)==(kk: KEY | keys:=keys\/{kk});
  List_Substitution(Machine(Keys),insertkey)==(keys:=keys\/{kk});
  List_Substitution(Machine(Keys),removekey)==(keys:=keys-{kk})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Keys))==(?);
  Inherited_List_Constants(Machine(Keys))==(?);
  List_Constants(Machine(Keys))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Keys),KEY)==(?);
  Context_List_Enumerated(Machine(Keys))==(?);
  Context_List_Defered(Machine(Keys))==(?);
  Context_List_Sets(Machine(Keys))==(?);
  List_Valuable_Sets(Machine(Keys))==(KEY);
  Inherited_List_Enumerated(Machine(Keys))==(?);
  Inherited_List_Defered(Machine(Keys))==(?);
  Inherited_List_Sets(Machine(Keys))==(?);
  List_Enumerated(Machine(Keys))==(?);
  List_Defered(Machine(Keys))==(KEY);
  List_Sets(Machine(Keys))==(KEY)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Keys))==(?);
  Expanded_List_HiddenConstants(Machine(Keys))==(?);
  List_HiddenConstants(Machine(Keys))==(?);
  External_List_HiddenConstants(Machine(Keys))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Keys))==(btrue);
  Context_List_Properties(Machine(Keys))==(btrue);
  Inherited_List_Properties(Machine(Keys))==(btrue);
  List_Properties(Machine(Keys))==(KEY: FIN(INTEGER) & not(KEY = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Keys),insertkey)==(?);
  List_ANY_Var(Machine(Keys),removekey)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Keys)) == (KEY | ? | keys | ? | insertkey,removekey | ? | ? | ? | Keys);
  List_Of_HiddenCst_Ids(Machine(Keys)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Keys)) == (?);
  List_Of_VisibleVar_Ids(Machine(Keys)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Keys)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Keys)) == (Type(KEY) == Cst(SetOf(atype(KEY,"[KEY","]KEY"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Keys)) == (Type(keys) == Mvl(SetOf(atype(KEY,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Keys)) == (Type(removekey) == Cst(No_type,atype(KEY,?,?));Type(insertkey) == Cst(No_type,atype(KEY,?,?)))
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
