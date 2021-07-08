Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Reading))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Reading))==(Machine(Reading));
  Level(Machine(Reading))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Reading)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Reading))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Reading))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Reading))==(?);
  List_Includes(Machine(Reading))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Reading))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Reading))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Reading))==(?);
  Context_List_Variables(Machine(Reading))==(?);
  Abstract_List_Variables(Machine(Reading))==(?);
  Local_List_Variables(Machine(Reading))==(books,copies,copyof,reading,hasread);
  List_Variables(Machine(Reading))==(books,copies,copyof,reading,hasread);
  External_List_Variables(Machine(Reading))==(books,copies,copyof,reading,hasread)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Reading))==(?);
  Abstract_List_VisibleVariables(Machine(Reading))==(?);
  External_List_VisibleVariables(Machine(Reading))==(?);
  Expanded_List_VisibleVariables(Machine(Reading))==(?);
  List_VisibleVariables(Machine(Reading))==(?);
  Internal_List_VisibleVariables(Machine(Reading))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Reading))==(btrue);
  Gluing_List_Invariant(Machine(Reading))==(btrue);
  Expanded_List_Invariant(Machine(Reading))==(btrue);
  Abstract_List_Invariant(Machine(Reading))==(btrue);
  Context_List_Invariant(Machine(Reading))==(btrue);
  List_Invariant(Machine(Reading))==(copies <: COPY & books <: BOOK & copyof: copies >-> books & hasread: READER <-> BOOK & reading: READER >+> COPY & (reading;copyof)/\hasread = {})
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Reading))==(btrue);
  Abstract_List_Assertions(Machine(Reading))==(btrue);
  Context_List_Assertions(Machine(Reading))==(btrue);
  List_Assertions(Machine(Reading))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Reading))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Reading))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Reading))==(hasread,reading,copyof,copies,books:={},{},{},{},{});
  Context_List_Initialisation(Machine(Reading))==(skip);
  List_Initialisation(Machine(Reading))==(hasread:={} || reading:={} || copyof:={} || copies:={} || books:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Reading))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Reading))==(btrue);
  List_Constraints(Machine(Reading))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Reading))==(add,start,finished,precurrentquery,currentquery,hasreadquery);
  List_Operations(Machine(Reading))==(add,start,finished,precurrentquery,currentquery,hasreadquery)
END
&
THEORY ListInputX IS
  List_Input(Machine(Reading),add)==(cc,bb);
  List_Input(Machine(Reading),start)==(rr,cc);
  List_Input(Machine(Reading),finished)==(rr,cc);
  List_Input(Machine(Reading),precurrentquery)==(rr);
  List_Input(Machine(Reading),currentquery)==(rr);
  List_Input(Machine(Reading),hasreadquery)==(rr,bb)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Reading),add)==(?);
  List_Output(Machine(Reading),start)==(?);
  List_Output(Machine(Reading),finished)==(?);
  List_Output(Machine(Reading),precurrentquery)==(resp);
  List_Output(Machine(Reading),currentquery)==(bb);
  List_Output(Machine(Reading),hasreadquery)==(resp)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Reading),add)==(add(cc,bb));
  List_Header(Machine(Reading),start)==(start(rr,cc));
  List_Header(Machine(Reading),finished)==(finished(rr,cc));
  List_Header(Machine(Reading),precurrentquery)==(resp <-- precurrentquery(rr));
  List_Header(Machine(Reading),currentquery)==(bb <-- currentquery(rr));
  List_Header(Machine(Reading),hasreadquery)==(resp <-- hasreadquery(rr,bb))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Reading),add)==(cc: COPY & bb: BOOK & cc/:copies & cc|->bb/:copyof);
  List_Precondition(Machine(Reading),start)==(rr: READER & cc: COPY & copyof(cc)/:hasread[{rr}] & rr/:dom(reading) & cc/:ran(reading));
  List_Precondition(Machine(Reading),finished)==(rr: READER & cc: COPY & rr: dom(reading) & cc = reading(rr));
  List_Precondition(Machine(Reading),precurrentquery)==(rr: READER);
  List_Precondition(Machine(Reading),currentquery)==(rr: READER & rr: dom(reading));
  List_Precondition(Machine(Reading),hasreadquery)==(rr: READER & bb: BOOK)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Reading),hasreadquery)==(rr: READER & bb: BOOK | bb: hasread[{rr}] ==> resp:=yes [] not(bb: hasread[{rr}]) ==> resp:=no);
  Expanded_List_Substitution(Machine(Reading),currentquery)==(rr: READER & rr: dom(reading) | bb:=copyof(reading(rr)));
  Expanded_List_Substitution(Machine(Reading),precurrentquery)==(rr: READER | rr: dom(reading) ==> resp:=yes [] not(rr: dom(reading)) ==> resp:=no);
  Expanded_List_Substitution(Machine(Reading),finished)==(rr: READER & cc: COPY & rr: dom(reading) & cc = reading(rr) | hasread,reading:=hasread\/{rr|->copyof(cc)},{rr}<<|reading);
  Expanded_List_Substitution(Machine(Reading),start)==(rr: READER & cc: COPY & copyof(cc)/:hasread[{rr}] & rr/:dom(reading) & cc/:ran(reading) | reading:=reading\/{rr|->cc});
  Expanded_List_Substitution(Machine(Reading),add)==(cc: COPY & bb: BOOK & cc/:copies & cc|->bb/:copyof | copies,books,copyof:=copies\/{cc},books\/{bb},{cc|->bb});
  List_Substitution(Machine(Reading),add)==(copies:=copies\/{cc} || books:=books\/{bb} || copyof:={cc|->bb});
  List_Substitution(Machine(Reading),start)==(reading:=reading\/{rr|->cc});
  List_Substitution(Machine(Reading),finished)==(hasread:=hasread\/{rr|->copyof(cc)} || reading:={rr}<<|reading);
  List_Substitution(Machine(Reading),precurrentquery)==(IF rr: dom(reading) THEN resp:=yes ELSE resp:=no END);
  List_Substitution(Machine(Reading),currentquery)==(bb:=copyof(reading(rr)));
  List_Substitution(Machine(Reading),hasreadquery)==(IF bb: hasread[{rr}] THEN resp:=yes ELSE resp:=no END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Reading))==(?);
  Inherited_List_Constants(Machine(Reading))==(?);
  List_Constants(Machine(Reading))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Reading),READER)==(?);
  Context_List_Enumerated(Machine(Reading))==(?);
  Context_List_Defered(Machine(Reading))==(?);
  Context_List_Sets(Machine(Reading))==(?);
  List_Valuable_Sets(Machine(Reading))==(READER,BOOK,COPY);
  Inherited_List_Enumerated(Machine(Reading))==(?);
  Inherited_List_Defered(Machine(Reading))==(?);
  Inherited_List_Sets(Machine(Reading))==(?);
  List_Enumerated(Machine(Reading))==(RESPONSE);
  List_Defered(Machine(Reading))==(READER,BOOK,COPY);
  List_Sets(Machine(Reading))==(READER,BOOK,COPY,RESPONSE);
  Set_Definition(Machine(Reading),BOOK)==(?);
  Set_Definition(Machine(Reading),COPY)==(?);
  Set_Definition(Machine(Reading),RESPONSE)==({yes,no})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Reading))==(?);
  Expanded_List_HiddenConstants(Machine(Reading))==(?);
  List_HiddenConstants(Machine(Reading))==(?);
  External_List_HiddenConstants(Machine(Reading))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Reading))==(btrue);
  Context_List_Properties(Machine(Reading))==(btrue);
  Inherited_List_Properties(Machine(Reading))==(btrue);
  List_Properties(Machine(Reading))==(READER: FIN(INTEGER) & not(READER = {}) & BOOK: FIN(INTEGER) & not(BOOK = {}) & COPY: FIN(INTEGER) & not(COPY = {}) & RESPONSE: FIN(INTEGER) & not(RESPONSE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Reading),add)==(?);
  List_ANY_Var(Machine(Reading),start)==(?);
  List_ANY_Var(Machine(Reading),finished)==(?);
  List_ANY_Var(Machine(Reading),precurrentquery)==(?);
  List_ANY_Var(Machine(Reading),currentquery)==(?);
  List_ANY_Var(Machine(Reading),hasreadquery)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Reading)) == (READER,BOOK,COPY,RESPONSE,yes,no | ? | books,copies,copyof,reading,hasread | ? | add,start,finished,precurrentquery,currentquery,hasreadquery | ? | ? | ? | Reading);
  List_Of_HiddenCst_Ids(Machine(Reading)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Reading)) == (?);
  List_Of_VisibleVar_Ids(Machine(Reading)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Reading)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Reading)) == (Type(READER) == Cst(SetOf(atype(READER,"[READER","]READER")));Type(BOOK) == Cst(SetOf(atype(BOOK,"[BOOK","]BOOK")));Type(COPY) == Cst(SetOf(atype(COPY,"[COPY","]COPY")));Type(RESPONSE) == Cst(SetOf(etype(RESPONSE,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Reading)) == (Type(yes) == Cst(etype(RESPONSE,0,1));Type(no) == Cst(etype(RESPONSE,0,1)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Reading)) == (Type(books) == Mvl(SetOf(atype(BOOK,?,?)));Type(copies) == Mvl(SetOf(atype(COPY,?,?)));Type(copyof) == Mvl(SetOf(atype(COPY,?,?)*atype(BOOK,?,?)));Type(reading) == Mvl(SetOf(atype(READER,?,?)*atype(COPY,?,?)));Type(hasread) == Mvl(SetOf(atype(READER,?,?)*atype(BOOK,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Reading)) == (Type(hasreadquery) == Cst(etype(RESPONSE,?,?),atype(READER,?,?)*atype(BOOK,?,?));Type(currentquery) == Cst(atype(BOOK,?,?),atype(READER,?,?));Type(precurrentquery) == Cst(etype(RESPONSE,?,?),atype(READER,?,?));Type(finished) == Cst(No_type,atype(READER,?,?)*atype(COPY,?,?));Type(start) == Cst(No_type,atype(READER,?,?)*atype(COPY,?,?));Type(add) == Cst(No_type,atype(COPY,?,?)*atype(BOOK,?,?)));
  Observers(Machine(Reading)) == (Type(hasreadquery) == Cst(etype(RESPONSE,?,?),atype(READER,?,?)*atype(BOOK,?,?));Type(currentquery) == Cst(atype(BOOK,?,?),atype(READER,?,?));Type(precurrentquery) == Cst(etype(RESPONSE,?,?),atype(READER,?,?)))
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
