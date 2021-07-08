Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Access))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Access))==(Machine(Access));
  Level(Machine(Access))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Access)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Access))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Access))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Access))==(?);
  List_Includes(Machine(Access))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Access))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Access))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Access))==(?);
  Context_List_Variables(Machine(Access))==(?);
  Abstract_List_Variables(Machine(Access))==(?);
  Local_List_Variables(Machine(Access))==(barred,access);
  List_Variables(Machine(Access))==(barred,access);
  External_List_Variables(Machine(Access))==(barred,access)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Access))==(?);
  Abstract_List_VisibleVariables(Machine(Access))==(?);
  External_List_VisibleVariables(Machine(Access))==(?);
  Expanded_List_VisibleVariables(Machine(Access))==(?);
  List_VisibleVariables(Machine(Access))==(?);
  Internal_List_VisibleVariables(Machine(Access))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Access))==(btrue);
  Gluing_List_Invariant(Machine(Access))==(btrue);
  Expanded_List_Invariant(Machine(Access))==(btrue);
  Abstract_List_Invariant(Machine(Access))==(btrue);
  Context_List_Invariant(Machine(Access))==(btrue);
  List_Invariant(Machine(Access))==(access: USER <-> PRINTER & barred: USER <-> OPTION & !uu.(uu: dom(access) => card(access[{uu}])<=6) & !uu.(uu: dom(barred) => card(barred[{uu}]/\(access;options)[{uu}]) = 0))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Access))==(btrue);
  Abstract_List_Assertions(Machine(Access))==(btrue);
  Context_List_Assertions(Machine(Access))==(btrue);
  List_Assertions(Machine(Access))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Access))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Access))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Access))==(access,barred:={},{});
  Context_List_Initialisation(Machine(Access))==(skip);
  List_Initialisation(Machine(Access))==(access,barred:={},{})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Access))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Access))==(btrue);
  List_Constraints(Machine(Access))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Access))==(add,block,ban,setbarred,unsetbarred,unify,exchange,maintenance,optionquery,printnumquery);
  List_Operations(Machine(Access))==(add,block,ban,setbarred,unsetbarred,unify,exchange,maintenance,optionquery,printnumquery)
END
&
THEORY ListInputX IS
  List_Input(Machine(Access),add)==(uu,pp);
  List_Input(Machine(Access),block)==(uu,pp);
  List_Input(Machine(Access),ban)==(uu);
  List_Input(Machine(Access),setbarred)==(uu,oo);
  List_Input(Machine(Access),unsetbarred)==(uu,oo);
  List_Input(Machine(Access),unify)==(u1,u2);
  List_Input(Machine(Access),exchange)==(u1,u2);
  List_Input(Machine(Access),maintenance)==(pp,aa);
  List_Input(Machine(Access),optionquery)==(uu,oo);
  List_Input(Machine(Access),printnumquery)==(pp)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Access),add)==(?);
  List_Output(Machine(Access),block)==(?);
  List_Output(Machine(Access),ban)==(?);
  List_Output(Machine(Access),setbarred)==(?);
  List_Output(Machine(Access),unsetbarred)==(?);
  List_Output(Machine(Access),unify)==(?);
  List_Output(Machine(Access),exchange)==(?);
  List_Output(Machine(Access),maintenance)==(?);
  List_Output(Machine(Access),optionquery)==(ans);
  List_Output(Machine(Access),printnumquery)==(nn)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Access),add)==(add(uu,pp));
  List_Header(Machine(Access),block)==(block(uu,pp));
  List_Header(Machine(Access),ban)==(ban(uu));
  List_Header(Machine(Access),setbarred)==(setbarred(uu,oo));
  List_Header(Machine(Access),unsetbarred)==(unsetbarred(uu,oo));
  List_Header(Machine(Access),unify)==(unify(u1,u2));
  List_Header(Machine(Access),exchange)==(exchange(u1,u2));
  List_Header(Machine(Access),maintenance)==(maintenance(pp,aa));
  List_Header(Machine(Access),optionquery)==(ans <-- optionquery(uu,oo));
  List_Header(Machine(Access),printnumquery)==(nn <-- printnumquery(pp))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Access),add)==(uu: USER & pp: PRINTER & card(access[{uu}])<6 & card(barred[{uu}]/\options[{pp}]) = 0);
  List_Precondition(Machine(Access),block)==(uu: USER & pp: PRINTER);
  List_Precondition(Machine(Access),ban)==(uu: USER);
  List_Precondition(Machine(Access),setbarred)==(uu: USER & oo: OPTION & uu|->oo/:(access;options));
  List_Precondition(Machine(Access),unsetbarred)==(uu: USER & oo: OPTION);
  List_Precondition(Machine(Access),unify)==(u1: USER & u2: USER & card((access\/{u1}*access[{u2}])[{u1}])<=6 & card((access\/{u2}*access[{u1}])[{u2}])<=6 & card(barred[{u1}]/\(access;options)[{u2}]) = 0 & card(barred[{u2}]/\(access;options)[{u1}]) = 0);
  List_Precondition(Machine(Access),exchange)==(u1: USER & u2: USER & !uu.(uu: USER & uu = u1 => not(u1 = u2)) & card(barred[{u1}]/\(access;options)[{u2}]) = 0 & card(barred[{u2}]/\(access;options)[{u1}]) = 0);
  List_Precondition(Machine(Access),maintenance)==(pp: PRINTER & aa: PRINTER & !tt.(tt: PRINTER & tt = pp => not(pp = aa)) & !oo.(oo: OPTION & oo: options[{pp}] => oo: options[{aa}]) & !oo.(oo: OPTION & oo: options[{aa}] => oo: options[{pp}]));
  List_Precondition(Machine(Access),optionquery)==(uu: USER & oo: OPTION);
  List_Precondition(Machine(Access),printnumquery)==(pp: PRINTER)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Access),printnumquery)==(pp: PRINTER | nn:=card(access|>{pp}));
  Expanded_List_Substitution(Machine(Access),optionquery)==(uu: USER & oo: OPTION | uu|->oo: (access;options) ==> ans:=ok [] not(uu|->oo: (access;options)) ==> ans:=noaccess);
  Expanded_List_Substitution(Machine(Access),maintenance)==(pp: PRINTER & aa: PRINTER & !tt.(tt: PRINTER & tt = pp => not(pp = aa)) & !oo.(oo: OPTION & oo: options[{pp}] => oo: options[{aa}]) & !oo.(oo: OPTION & oo: options[{aa}] => oo: options[{pp}]) | access:=access-(access|>{pp})\/access~[{pp}]*{aa});
  Expanded_List_Substitution(Machine(Access),exchange)==(u1: USER & u2: USER & !uu.(uu: USER & uu = u1 => not(u1 = u2)) & card(barred[{u1}]/\(access;options)[{u2}]) = 0 & card(barred[{u2}]/\(access;options)[{u1}]) = 0 | access:=access-({u1}<|access\/({u2}<|access))\/{u1}*access[{u2}]\/{u2}*access[{u1}]);
  Expanded_List_Substitution(Machine(Access),unify)==(u1: USER & u2: USER & card((access\/{u1}*access[{u2}])[{u1}])<=6 & card((access\/{u2}*access[{u1}])[{u2}])<=6 & card(barred[{u1}]/\(access;options)[{u2}]) = 0 & card(barred[{u2}]/\(access;options)[{u1}]) = 0 | access:=access\/{u1}*access[{u2}]\/{u2}*access[{u1}]);
  Expanded_List_Substitution(Machine(Access),unsetbarred)==(uu: USER & oo: OPTION | barred:=barred-{uu|->oo});
  Expanded_List_Substitution(Machine(Access),setbarred)==(uu: USER & oo: OPTION & uu|->oo/:(access;options) | barred:=barred\/{uu|->oo});
  Expanded_List_Substitution(Machine(Access),ban)==(uu: USER | access:={uu}<<|access);
  Expanded_List_Substitution(Machine(Access),block)==(uu: USER & pp: PRINTER | access:=access-{uu|->pp});
  Expanded_List_Substitution(Machine(Access),add)==(uu: USER & pp: PRINTER & card(access[{uu}])<6 & card(barred[{uu}]/\options[{pp}]) = 0 | access:=access\/{uu|->pp});
  List_Substitution(Machine(Access),add)==(access:=access\/{uu|->pp});
  List_Substitution(Machine(Access),block)==(access:=access-{uu|->pp});
  List_Substitution(Machine(Access),ban)==(access:={uu}<<|access);
  List_Substitution(Machine(Access),setbarred)==(barred:=barred\/{uu|->oo});
  List_Substitution(Machine(Access),unsetbarred)==(barred:=barred-{uu|->oo});
  List_Substitution(Machine(Access),unify)==(access:=access\/{u1}*access[{u2}]\/{u2}*access[{u1}]);
  List_Substitution(Machine(Access),exchange)==(access:=access-({u1}<|access\/({u2}<|access))\/{u1}*access[{u2}]\/{u2}*access[{u1}]);
  List_Substitution(Machine(Access),maintenance)==(access:=access-(access|>{pp})\/access~[{pp}]*{aa});
  List_Substitution(Machine(Access),optionquery)==(IF uu|->oo: (access;options) THEN ans:=ok ELSE ans:=noaccess END);
  List_Substitution(Machine(Access),printnumquery)==(nn:=card(access|>{pp}))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Access))==(options);
  Inherited_List_Constants(Machine(Access))==(?);
  List_Constants(Machine(Access))==(options)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Access),USER)==(?);
  Context_List_Enumerated(Machine(Access))==(?);
  Context_List_Defered(Machine(Access))==(?);
  Context_List_Sets(Machine(Access))==(?);
  List_Valuable_Sets(Machine(Access))==(USER,PRINTER,OPTION);
  Inherited_List_Enumerated(Machine(Access))==(?);
  Inherited_List_Defered(Machine(Access))==(?);
  Inherited_List_Sets(Machine(Access))==(?);
  List_Enumerated(Machine(Access))==(PERMISSION);
  List_Defered(Machine(Access))==(USER,PRINTER,OPTION);
  List_Sets(Machine(Access))==(USER,PRINTER,OPTION,PERMISSION);
  Set_Definition(Machine(Access),PRINTER)==(?);
  Set_Definition(Machine(Access),OPTION)==(?);
  Set_Definition(Machine(Access),PERMISSION)==({ok,noaccess})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Access))==(?);
  Expanded_List_HiddenConstants(Machine(Access))==(?);
  List_HiddenConstants(Machine(Access))==(?);
  External_List_HiddenConstants(Machine(Access))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Access))==(btrue);
  Context_List_Properties(Machine(Access))==(btrue);
  Inherited_List_Properties(Machine(Access))==(btrue);
  List_Properties(Machine(Access))==(options: PRINTER <-> OPTION & dom(options) = PRINTER & ran(options) = OPTION & USER: FIN(INTEGER) & not(USER = {}) & PRINTER: FIN(INTEGER) & not(PRINTER = {}) & OPTION: FIN(INTEGER) & not(OPTION = {}) & PERMISSION: FIN(INTEGER) & not(PERMISSION = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Access),add)==(?);
  List_ANY_Var(Machine(Access),block)==(?);
  List_ANY_Var(Machine(Access),ban)==(?);
  List_ANY_Var(Machine(Access),setbarred)==(?);
  List_ANY_Var(Machine(Access),unsetbarred)==(?);
  List_ANY_Var(Machine(Access),unify)==(?);
  List_ANY_Var(Machine(Access),exchange)==(?);
  List_ANY_Var(Machine(Access),maintenance)==(?);
  List_ANY_Var(Machine(Access),optionquery)==(?);
  List_ANY_Var(Machine(Access),printnumquery)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Access)) == (options,USER,PRINTER,OPTION,PERMISSION,ok,noaccess | ? | barred,access | ? | add,block,ban,setbarred,unsetbarred,unify,exchange,maintenance,optionquery,printnumquery | ? | ? | ? | Access);
  List_Of_HiddenCst_Ids(Machine(Access)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Access)) == (options);
  List_Of_VisibleVar_Ids(Machine(Access)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Access)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Access)) == (Type(USER) == Cst(SetOf(atype(USER,"[USER","]USER")));Type(PRINTER) == Cst(SetOf(atype(PRINTER,"[PRINTER","]PRINTER")));Type(OPTION) == Cst(SetOf(atype(OPTION,"[OPTION","]OPTION")));Type(PERMISSION) == Cst(SetOf(etype(PERMISSION,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Access)) == (Type(ok) == Cst(etype(PERMISSION,0,1));Type(noaccess) == Cst(etype(PERMISSION,0,1));Type(options) == Cst(SetOf(atype(PRINTER,?,?)*atype(OPTION,?,?))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Access)) == (Type(barred) == Mvl(SetOf(atype(USER,?,?)*atype(OPTION,?,?)));Type(access) == Mvl(SetOf(atype(USER,?,?)*atype(PRINTER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Access)) == (Type(printnumquery) == Cst(btype(INTEGER,?,?),atype(PRINTER,?,?));Type(optionquery) == Cst(etype(PERMISSION,?,?),atype(USER,?,?)*atype(OPTION,?,?));Type(maintenance) == Cst(No_type,atype(PRINTER,?,?)*atype(PRINTER,?,?));Type(exchange) == Cst(No_type,atype(USER,?,?)*atype(USER,?,?));Type(unify) == Cst(No_type,atype(USER,?,?)*atype(USER,?,?));Type(unsetbarred) == Cst(No_type,atype(USER,?,?)*atype(OPTION,?,?));Type(setbarred) == Cst(No_type,atype(USER,?,?)*atype(OPTION,?,?));Type(ban) == Cst(No_type,atype(USER,?,?));Type(block) == Cst(No_type,atype(USER,?,?)*atype(PRINTER,?,?));Type(add) == Cst(No_type,atype(USER,?,?)*atype(PRINTER,?,?)));
  Observers(Machine(Access)) == (Type(printnumquery) == Cst(btype(INTEGER,?,?),atype(PRINTER,?,?));Type(optionquery) == Cst(etype(PERMISSION,?,?),atype(USER,?,?)*atype(OPTION,?,?)))
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
