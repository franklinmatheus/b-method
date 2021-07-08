Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Paperround))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Paperround))==(Machine(Paperround));
  Level(Machine(Paperround))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Paperround)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Paperround))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Paperround))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Paperround))==(?);
  List_Includes(Machine(Paperround))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Paperround))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Paperround))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Paperround))==(?);
  Context_List_Variables(Machine(Paperround))==(?);
  Abstract_List_Variables(Machine(Paperround))==(?);
  Local_List_Variables(Machine(Paperround))==(magazines,papers);
  List_Variables(Machine(Paperround))==(magazines,papers);
  External_List_Variables(Machine(Paperround))==(magazines,papers)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Paperround))==(?);
  Abstract_List_VisibleVariables(Machine(Paperround))==(?);
  External_List_VisibleVariables(Machine(Paperround))==(?);
  Expanded_List_VisibleVariables(Machine(Paperround))==(?);
  List_VisibleVariables(Machine(Paperround))==(?);
  Internal_List_VisibleVariables(Machine(Paperround))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Paperround))==(btrue);
  Gluing_List_Invariant(Machine(Paperround))==(btrue);
  Expanded_List_Invariant(Machine(Paperround))==(btrue);
  Abstract_List_Invariant(Machine(Paperround))==(btrue);
  Context_List_Invariant(Machine(Paperround))==(btrue);
  List_Invariant(Machine(Paperround))==(papers <: 1..163 & magazines <: papers & magazines: FIN(magazines) & papers: FIN(papers) & card(papers)<=60 & 2*card(magazines)<=card(papers))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Paperround))==(btrue);
  Abstract_List_Assertions(Machine(Paperround))==(btrue);
  Context_List_Assertions(Machine(Paperround))==(btrue);
  List_Assertions(Machine(Paperround))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Paperround))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Paperround))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Paperround))==(papers,magazines:={},{});
  Context_List_Initialisation(Machine(Paperround))==(skip);
  List_Initialisation(Machine(Paperround))==(papers:={} || magazines:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Paperround))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Paperround))==(btrue);
  List_Constraints(Machine(Paperround))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Paperround))==(addpaper,addmagazine,remove,allmags,removehouse);
  List_Operations(Machine(Paperround))==(addpaper,addmagazine,remove,allmags,removehouse)
END
&
THEORY ListInputX IS
  List_Input(Machine(Paperround),addpaper)==(hh);
  List_Input(Machine(Paperround),addmagazine)==(hh);
  List_Input(Machine(Paperround),remove)==(hh);
  List_Input(Machine(Paperround),allmags)==(?);
  List_Input(Machine(Paperround),removehouse)==(hh)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Paperround),addpaper)==(?);
  List_Output(Machine(Paperround),addmagazine)==(?);
  List_Output(Machine(Paperround),remove)==(?);
  List_Output(Machine(Paperround),allmags)==(?);
  List_Output(Machine(Paperround),removehouse)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Paperround),addpaper)==(addpaper(hh));
  List_Header(Machine(Paperround),addmagazine)==(addmagazine(hh));
  List_Header(Machine(Paperround),remove)==(remove(hh));
  List_Header(Machine(Paperround),allmags)==(allmags);
  List_Header(Machine(Paperround),removehouse)==(removehouse(hh))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Paperround),addpaper)==(hh: 1..163 & card(papers)<60);
  List_Precondition(Machine(Paperround),addmagazine)==(hh: papers & 2*card(magazines\/{hh})<=card(papers));
  List_Precondition(Machine(Paperround),remove)==(hh: 1..163 & 2*card(magazines-{hh})<=card(papers-{hh}));
  List_Precondition(Machine(Paperround),allmags)==(2*card(papers)<=card(papers));
  List_Precondition(Machine(Paperround),removehouse)==(hh: papers & hh/:magazines & 2*card(magazines)<=card(papers-{hh}))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Paperround),removehouse)==(hh: papers & hh/:magazines & 2*card(magazines)<=card(papers-{hh}) | papers:=papers-{hh});
  Expanded_List_Substitution(Machine(Paperround),allmags)==(2*card(papers)<=card(papers) | magazines:=papers);
  Expanded_List_Substitution(Machine(Paperround),remove)==(hh: 1..163 & 2*card(magazines-{hh})<=card(papers-{hh}) | papers,magazines:=papers-{hh},magazines-{hh});
  Expanded_List_Substitution(Machine(Paperround),addmagazine)==(hh: papers & 2*card(magazines\/{hh})<=card(papers) | magazines:=magazines\/{hh});
  Expanded_List_Substitution(Machine(Paperround),addpaper)==(hh: 1..163 & card(papers)<60 | papers:=papers\/{hh});
  List_Substitution(Machine(Paperround),addpaper)==(papers:=papers\/{hh});
  List_Substitution(Machine(Paperround),addmagazine)==(magazines:=magazines\/{hh});
  List_Substitution(Machine(Paperround),remove)==(papers:=papers-{hh} || magazines:=magazines-{hh});
  List_Substitution(Machine(Paperround),allmags)==(magazines:=papers);
  List_Substitution(Machine(Paperround),removehouse)==(papers:=papers-{hh})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Paperround))==(?);
  Inherited_List_Constants(Machine(Paperround))==(?);
  List_Constants(Machine(Paperround))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Paperround))==(?);
  Context_List_Defered(Machine(Paperround))==(?);
  Context_List_Sets(Machine(Paperround))==(?);
  List_Valuable_Sets(Machine(Paperround))==(?);
  Inherited_List_Enumerated(Machine(Paperround))==(?);
  Inherited_List_Defered(Machine(Paperround))==(?);
  Inherited_List_Sets(Machine(Paperround))==(?);
  List_Enumerated(Machine(Paperround))==(?);
  List_Defered(Machine(Paperround))==(?);
  List_Sets(Machine(Paperround))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Paperround))==(?);
  Expanded_List_HiddenConstants(Machine(Paperround))==(?);
  List_HiddenConstants(Machine(Paperround))==(?);
  External_List_HiddenConstants(Machine(Paperround))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Paperround))==(btrue);
  Context_List_Properties(Machine(Paperround))==(btrue);
  Inherited_List_Properties(Machine(Paperround))==(btrue);
  List_Properties(Machine(Paperround))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Paperround),addpaper)==(?);
  List_ANY_Var(Machine(Paperround),addmagazine)==(?);
  List_ANY_Var(Machine(Paperround),remove)==(?);
  List_ANY_Var(Machine(Paperround),allmags)==(?);
  List_ANY_Var(Machine(Paperround),removehouse)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Paperround)) == (? | ? | magazines,papers | ? | addpaper,addmagazine,remove,allmags,removehouse | ? | ? | ? | Paperround);
  List_Of_HiddenCst_Ids(Machine(Paperround)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Paperround)) == (?);
  List_Of_VisibleVar_Ids(Machine(Paperround)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Paperround)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Paperround)) == (Type(magazines) == Mvl(SetOf(btype(INTEGER,?,?)));Type(papers) == Mvl(SetOf(btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Paperround)) == (Type(removehouse) == Cst(No_type,btype(INTEGER,?,?));Type(allmags) == Cst(No_type,No_type);Type(remove) == Cst(No_type,btype(INTEGER,?,?));Type(addmagazine) == Cst(No_type,btype(INTEGER,?,?));Type(addpaper) == Cst(No_type,btype(INTEGER,?,?)))
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
