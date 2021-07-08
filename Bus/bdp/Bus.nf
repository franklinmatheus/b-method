Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Bus))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Bus))==(Machine(Bus));
  Level(Machine(Bus))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Bus)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Bus))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Bus))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Bus))==(?);
  List_Includes(Machine(Bus))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Bus))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Bus))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Bus))==(?);
  Context_List_Variables(Machine(Bus))==(?);
  Abstract_List_Variables(Machine(Bus))==(?);
  Local_List_Variables(Machine(Bus))==(passengers,tickets);
  List_Variables(Machine(Bus))==(passengers,tickets);
  External_List_Variables(Machine(Bus))==(passengers,tickets)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Bus))==(?);
  Abstract_List_VisibleVariables(Machine(Bus))==(?);
  External_List_VisibleVariables(Machine(Bus))==(?);
  Expanded_List_VisibleVariables(Machine(Bus))==(?);
  List_VisibleVariables(Machine(Bus))==(?);
  Internal_List_VisibleVariables(Machine(Bus))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Bus))==(btrue);
  Gluing_List_Invariant(Machine(Bus))==(btrue);
  Expanded_List_Invariant(Machine(Bus))==(btrue);
  Abstract_List_Invariant(Machine(Bus))==(btrue);
  Context_List_Invariant(Machine(Bus))==(btrue);
  List_Invariant(Machine(Bus))==(tickets: NATURAL & passengers: NATURAL & tickets<=passengers+1 & passengers<=tickets+45)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Bus))==(btrue);
  Abstract_List_Assertions(Machine(Bus))==(btrue);
  Context_List_Assertions(Machine(Bus))==(btrue);
  List_Assertions(Machine(Bus))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Bus))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Bus))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Bus))==(tickets,passengers:=0,0);
  Context_List_Initialisation(Machine(Bus))==(skip);
  List_Initialisation(Machine(Bus))==(tickets,passengers:=0,0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Bus))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Bus))==(btrue);
  List_Constraints(Machine(Bus))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Bus))==(buy,board,double);
  List_Operations(Machine(Bus))==(buy,board,double)
END
&
THEORY ListInputX IS
  List_Input(Machine(Bus),buy)==(mm);
  List_Input(Machine(Bus),board)==(nn);
  List_Input(Machine(Bus),double)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Bus),buy)==(?);
  List_Output(Machine(Bus),board)==(?);
  List_Output(Machine(Bus),double)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Bus),buy)==(buy(mm));
  List_Header(Machine(Bus),board)==(board(nn));
  List_Header(Machine(Bus),double)==(double)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Bus),buy)==(mm: NATURAL & tickets+mm<=passengers+1);
  List_Precondition(Machine(Bus),board)==(nn: NATURAL & passengers+nn<=tickets+45);
  List_Precondition(Machine(Bus),double)==(2*passengers<=2*tickets+45 & 2*tickets<=2*passengers+1)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Bus),double)==(2*passengers<=2*tickets+45 & 2*tickets<=2*passengers+1 | tickets,passengers:=2*tickets,2*passengers);
  Expanded_List_Substitution(Machine(Bus),board)==(nn: NATURAL & passengers+nn<=tickets+45 | passengers:=passengers+nn);
  Expanded_List_Substitution(Machine(Bus),buy)==(mm: NATURAL & tickets+mm<=passengers+1 | tickets:=tickets+mm);
  List_Substitution(Machine(Bus),buy)==(tickets:=tickets+mm);
  List_Substitution(Machine(Bus),board)==(passengers:=passengers+nn);
  List_Substitution(Machine(Bus),double)==(tickets,passengers:=2*tickets,2*passengers)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Bus))==(?);
  Inherited_List_Constants(Machine(Bus))==(?);
  List_Constants(Machine(Bus))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Bus))==(?);
  Context_List_Defered(Machine(Bus))==(?);
  Context_List_Sets(Machine(Bus))==(?);
  List_Valuable_Sets(Machine(Bus))==(?);
  Inherited_List_Enumerated(Machine(Bus))==(?);
  Inherited_List_Defered(Machine(Bus))==(?);
  Inherited_List_Sets(Machine(Bus))==(?);
  List_Enumerated(Machine(Bus))==(?);
  List_Defered(Machine(Bus))==(?);
  List_Sets(Machine(Bus))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Bus))==(?);
  Expanded_List_HiddenConstants(Machine(Bus))==(?);
  List_HiddenConstants(Machine(Bus))==(?);
  External_List_HiddenConstants(Machine(Bus))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Bus))==(btrue);
  Context_List_Properties(Machine(Bus))==(btrue);
  Inherited_List_Properties(Machine(Bus))==(btrue);
  List_Properties(Machine(Bus))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Bus),buy)==(?);
  List_ANY_Var(Machine(Bus),board)==(?);
  List_ANY_Var(Machine(Bus),double)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Bus)) == (? | ? | passengers,tickets | ? | buy,board,double | ? | ? | ? | Bus);
  List_Of_HiddenCst_Ids(Machine(Bus)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Bus)) == (?);
  List_Of_VisibleVar_Ids(Machine(Bus)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Bus)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Bus)) == (Type(passengers) == Mvl(btype(INTEGER,?,?));Type(tickets) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Bus)) == (Type(double) == Cst(No_type,No_type);Type(board) == Cst(No_type,btype(INTEGER,?,?));Type(buy) == Cst(No_type,btype(INTEGER,?,?)))
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
