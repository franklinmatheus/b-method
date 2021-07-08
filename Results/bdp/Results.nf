Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Results))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Results))==(Machine(Results));
  Level(Machine(Results))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Results)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Results))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Results))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Results))==(?);
  List_Includes(Machine(Results))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Results))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Results))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Results))==(?);
  Context_List_Variables(Machine(Results))==(?);
  Abstract_List_Variables(Machine(Results))==(?);
  Local_List_Variables(Machine(Results))==(finish);
  List_Variables(Machine(Results))==(finish);
  External_List_Variables(Machine(Results))==(finish)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Results))==(?);
  Abstract_List_VisibleVariables(Machine(Results))==(?);
  External_List_VisibleVariables(Machine(Results))==(?);
  Expanded_List_VisibleVariables(Machine(Results))==(?);
  List_VisibleVariables(Machine(Results))==(?);
  Internal_List_VisibleVariables(Machine(Results))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Results))==(btrue);
  Gluing_List_Invariant(Machine(Results))==(btrue);
  Expanded_List_Invariant(Machine(Results))==(btrue);
  Abstract_List_Invariant(Machine(Results))==(btrue);
  Context_List_Invariant(Machine(Results))==(btrue);
  List_Invariant(Machine(Results))==(finish: iseq(RUNNER))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Results))==(btrue);
  Abstract_List_Assertions(Machine(Results))==(btrue);
  Context_List_Assertions(Machine(Results))==(btrue);
  List_Assertions(Machine(Results))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Results))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Results))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Results))==(finish:=<>);
  Context_List_Initialisation(Machine(Results))==(skip);
  List_Initialisation(Machine(Results))==(finish:=<>)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Results))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Results))==(btrue);
  List_Constraints(Machine(Results))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Results))==(finished,query,disqualify,medals,position,remove);
  List_Operations(Machine(Results))==(finished,query,disqualify,medals,position,remove)
END
&
THEORY ListInputX IS
  List_Input(Machine(Results),finished)==(rr);
  List_Input(Machine(Results),query)==(pp);
  List_Input(Machine(Results),disqualify)==(pp);
  List_Input(Machine(Results),medals)==(?);
  List_Input(Machine(Results),position)==(rr);
  List_Input(Machine(Results),remove)==(rr)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Results),finished)==(?);
  List_Output(Machine(Results),query)==(rr);
  List_Output(Machine(Results),disqualify)==(?);
  List_Output(Machine(Results),medals)==(ss);
  List_Output(Machine(Results),position)==(pp);
  List_Output(Machine(Results),remove)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Results),finished)==(finished(rr));
  List_Header(Machine(Results),query)==(rr <-- query(pp));
  List_Header(Machine(Results),disqualify)==(disqualify(pp));
  List_Header(Machine(Results),medals)==(ss <-- medals);
  List_Header(Machine(Results),position)==(pp <-- position(rr));
  List_Header(Machine(Results),remove)==(remove(rr))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Results),finished)==(rr: RUNNER & rr/:ran(finish));
  List_Precondition(Machine(Results),query)==(pp: NAT1 & pp<=size(finish));
  List_Precondition(Machine(Results),disqualify)==(pp: NAT1 & pp<=size(finish));
  List_Precondition(Machine(Results),medals)==(size(finish)>=3);
  List_Precondition(Machine(Results),position)==(rr: RUNNER & rr: ran(finish));
  List_Precondition(Machine(Results),remove)==(rr: RUNNER & rr: ran(finish))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Results),remove)==(rr: RUNNER & rr: ran(finish) | finish:=finish/|\finish~(rr)-1^(finish\|/finish~(rr)));
  Expanded_List_Substitution(Machine(Results),position)==(rr: RUNNER & rr: ran(finish) | pp:=finish~(rr));
  Expanded_List_Substitution(Machine(Results),medals)==(size(finish)>=3 | ss:=finish/|\3);
  Expanded_List_Substitution(Machine(Results),disqualify)==(pp: NAT1 & pp<=size(finish) | finish:=finish/|\pp-1^(finish\|/pp));
  Expanded_List_Substitution(Machine(Results),query)==(pp: NAT1 & pp<=size(finish) | rr:=finish(pp));
  Expanded_List_Substitution(Machine(Results),finished)==(rr: RUNNER & rr/:ran(finish) | finish:=finish<-rr);
  List_Substitution(Machine(Results),finished)==(finish:=finish<-rr);
  List_Substitution(Machine(Results),query)==(rr:=finish(pp));
  List_Substitution(Machine(Results),disqualify)==(finish:=finish/|\pp-1^(finish\|/pp));
  List_Substitution(Machine(Results),medals)==(ss:=finish/|\3);
  List_Substitution(Machine(Results),position)==(pp:=finish~(rr));
  List_Substitution(Machine(Results),remove)==(finish:=finish/|\finish~(rr)-1^(finish\|/finish~(rr)))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Results))==(?);
  Inherited_List_Constants(Machine(Results))==(?);
  List_Constants(Machine(Results))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Results),RUNNER)==(?);
  Context_List_Enumerated(Machine(Results))==(?);
  Context_List_Defered(Machine(Results))==(?);
  Context_List_Sets(Machine(Results))==(?);
  List_Valuable_Sets(Machine(Results))==(RUNNER);
  Inherited_List_Enumerated(Machine(Results))==(?);
  Inherited_List_Defered(Machine(Results))==(?);
  Inherited_List_Sets(Machine(Results))==(?);
  List_Enumerated(Machine(Results))==(?);
  List_Defered(Machine(Results))==(RUNNER);
  List_Sets(Machine(Results))==(RUNNER)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Results))==(?);
  Expanded_List_HiddenConstants(Machine(Results))==(?);
  List_HiddenConstants(Machine(Results))==(?);
  External_List_HiddenConstants(Machine(Results))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Results))==(btrue);
  Context_List_Properties(Machine(Results))==(btrue);
  Inherited_List_Properties(Machine(Results))==(btrue);
  List_Properties(Machine(Results))==(RUNNER: FIN(INTEGER) & not(RUNNER = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Results),finished)==(?);
  List_ANY_Var(Machine(Results),query)==(?);
  List_ANY_Var(Machine(Results),disqualify)==(?);
  List_ANY_Var(Machine(Results),medals)==(?);
  List_ANY_Var(Machine(Results),position)==(?);
  List_ANY_Var(Machine(Results),remove)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Results)) == (RUNNER | ? | finish | ? | finished,query,disqualify,medals,position,remove | ? | ? | ? | Results);
  List_Of_HiddenCst_Ids(Machine(Results)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Results)) == (?);
  List_Of_VisibleVar_Ids(Machine(Results)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Results)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Results)) == (Type(RUNNER) == Cst(SetOf(atype(RUNNER,"[RUNNER","]RUNNER"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Results)) == (Type(finish) == Mvl(SetOf(btype(INTEGER,?,?)*atype(RUNNER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Results)) == (Type(remove) == Cst(No_type,atype(RUNNER,?,?));Type(position) == Cst(btype(INTEGER,?,?),atype(RUNNER,?,?));Type(medals) == Cst(SetOf(btype(INTEGER,?,?)*atype(RUNNER,?,?)),No_type);Type(disqualify) == Cst(No_type,btype(INTEGER,?,?));Type(query) == Cst(atype(RUNNER,?,?),btype(INTEGER,?,?));Type(finished) == Cst(No_type,atype(RUNNER,?,?)));
  Observers(Machine(Results)) == (Type(position) == Cst(btype(INTEGER,?,?),atype(RUNNER,?,?));Type(medals) == Cst(SetOf(btype(INTEGER,?,?)*atype(RUNNER,?,?)),No_type);Type(query) == Cst(atype(RUNNER,?,?),btype(INTEGER,?,?)))
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
