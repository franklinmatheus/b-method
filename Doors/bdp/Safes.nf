Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Safes))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Safes))==(Machine(Safes));
  Level(Machine(Safes))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Safes)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Safes))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Safes))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Safes))==(Keys,Locks,Doors);
  List_Includes(Machine(Safes))==(Locks,Keys)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Safes))==(opendoor,closedoor,lockdoor)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Safes))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Safes))==(?);
  Context_List_Variables(Machine(Safes))==(?);
  Abstract_List_Variables(Machine(Safes))==(?);
  Local_List_Variables(Machine(Safes))==(unlocks,masterkey);
  List_Variables(Machine(Safes))==(unlocks,masterkey,status,position,keys);
  External_List_Variables(Machine(Safes))==(unlocks,masterkey,status,position,keys)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Safes))==(?);
  Abstract_List_VisibleVariables(Machine(Safes))==(?);
  External_List_VisibleVariables(Machine(Safes))==(?);
  Expanded_List_VisibleVariables(Machine(Safes))==(?);
  List_VisibleVariables(Machine(Safes))==(?);
  Internal_List_VisibleVariables(Machine(Safes))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Safes))==(btrue);
  Gluing_List_Invariant(Machine(Safes))==(btrue);
  Abstract_List_Invariant(Machine(Safes))==(btrue);
  Expanded_List_Invariant(Machine(Safes))==(status: DOOR --> STATUS & position~[{open}] <: status~[{unlocked}] & position: DOOR --> POSITION & keys <: KEY);
  Context_List_Invariant(Machine(Safes))==(btrue);
  List_Invariant(Machine(Safes))==(unlocks: KEY >+> DOOR & status~[{unlocked}] <: unlocks[keys] & masterkey: NAT)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Safes))==(btrue);
  Expanded_List_Assertions(Machine(Safes))==(btrue);
  Context_List_Assertions(Machine(Safes))==(btrue);
  List_Assertions(Machine(Safes))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Safes))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Safes))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Safes))==(position:=DOOR*{closed};status:=DOOR*{locked};keys:={};masterkey,unlocks:=0,{});
  Context_List_Initialisation(Machine(Safes))==(skip);
  List_Initialisation(Machine(Safes))==(masterkey:=0 || unlocks:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Safes))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Safes),Machine(Locks))==(?);
  List_Instanciated_Parameters(Machine(Safes),Machine(Keys))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Safes),Machine(Keys))==(btrue);
  List_Context_Constraints(Machine(Safes))==(btrue);
  List_Constraints(Machine(Safes))==(btrue);
  List_Constraints(Machine(Safes),Machine(Locks))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Safes))==(insert,extract,unlock,quicklock,quickcloseandlock,insertmaster,removemaster,allocate,deallocate,opendoor,lockdoor,closedoor);
  List_Operations(Machine(Safes))==(insert,extract,unlock,quicklock,quickcloseandlock,insertmaster,removemaster,allocate,deallocate,opendoor,lockdoor,closedoor)
END
&
THEORY ListInputX IS
  List_Input(Machine(Safes),closedoor)==(dd);
  List_Input(Machine(Safes),lockdoor)==(dd);
  List_Input(Machine(Safes),opendoor)==(dd);
  List_Input(Machine(Safes),insert)==(kk,dd,mk);
  List_Input(Machine(Safes),extract)==(kk,dd,mk);
  List_Input(Machine(Safes),unlock)==(dd);
  List_Input(Machine(Safes),quicklock)==(dd);
  List_Input(Machine(Safes),quickcloseandlock)==(dd);
  List_Input(Machine(Safes),insertmaster)==(kk);
  List_Input(Machine(Safes),removemaster)==(?);
  List_Input(Machine(Safes),allocate)==(kk,dd);
  List_Input(Machine(Safes),deallocate)==(kk,dd)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Safes),closedoor)==(?);
  List_Output(Machine(Safes),lockdoor)==(?);
  List_Output(Machine(Safes),opendoor)==(?);
  List_Output(Machine(Safes),insert)==(?);
  List_Output(Machine(Safes),extract)==(?);
  List_Output(Machine(Safes),unlock)==(?);
  List_Output(Machine(Safes),quicklock)==(?);
  List_Output(Machine(Safes),quickcloseandlock)==(?);
  List_Output(Machine(Safes),insertmaster)==(?);
  List_Output(Machine(Safes),removemaster)==(?);
  List_Output(Machine(Safes),allocate)==(?);
  List_Output(Machine(Safes),deallocate)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Safes),closedoor)==(closedoor(dd));
  List_Header(Machine(Safes),lockdoor)==(lockdoor(dd));
  List_Header(Machine(Safes),opendoor)==(opendoor(dd));
  List_Header(Machine(Safes),insert)==(insert(kk,dd,mk));
  List_Header(Machine(Safes),extract)==(extract(kk,dd,mk));
  List_Header(Machine(Safes),unlock)==(unlock(dd));
  List_Header(Machine(Safes),quicklock)==(quicklock(dd));
  List_Header(Machine(Safes),quickcloseandlock)==(quickcloseandlock(dd));
  List_Header(Machine(Safes),insertmaster)==(insertmaster(kk));
  List_Header(Machine(Safes),removemaster)==(removemaster);
  List_Header(Machine(Safes),allocate)==(allocate(kk,dd));
  List_Header(Machine(Safes),deallocate)==(deallocate(kk,dd))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  Own_Precondition(Machine(Safes),closedoor)==(dd: DOOR);
  List_Precondition(Machine(Safes),closedoor)==(dd: DOOR);
  Own_Precondition(Machine(Safes),lockdoor)==(dd: DOOR & position(dd) = closed);
  List_Precondition(Machine(Safes),lockdoor)==(dd: DOOR & position(dd) = closed);
  Own_Precondition(Machine(Safes),opendoor)==(dd: DOOR & status(dd) = unlocked);
  List_Precondition(Machine(Safes),opendoor)==(dd: DOOR & status(dd) = unlocked);
  List_Precondition(Machine(Safes),insert)==(kk: KEY & dd: DOOR & unlocks(kk) = dd & mk: NAT & mk = masterkey);
  List_Precondition(Machine(Safes),extract)==(kk: KEY & dd: DOOR & unlocks(kk) = dd & status(dd) = locked & mk: NAT & mk = masterkey);
  List_Precondition(Machine(Safes),unlock)==(dd: DOOR & unlocks~(dd): keys);
  List_Precondition(Machine(Safes),quicklock)==(dd: DOOR & position(dd) = closed);
  List_Precondition(Machine(Safes),quickcloseandlock)==(dd: DOOR & position(dd) = open);
  List_Precondition(Machine(Safes),insertmaster)==(kk: NAT & kk/=0 & masterkey = 0);
  List_Precondition(Machine(Safes),removemaster)==(masterkey/=0);
  List_Precondition(Machine(Safes),allocate)==(kk: KEY & dd: DOOR & kk/:dom(unlocks) & dd/:ran(unlocks));
  List_Precondition(Machine(Safes),deallocate)==(kk: KEY & kk: dom(unlocks) & dd: DOOR & dd: ran(unlocks))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Safes),deallocate)==(kk: KEY & kk: dom(unlocks) & dd: DOOR & dd: ran(unlocks) & kk: KEY | unlocks:=unlocks-{kk|->dd} || keys:=keys-{kk});
  Expanded_List_Substitution(Machine(Safes),allocate)==(kk: KEY & dd: DOOR & kk/:dom(unlocks) & dd/:ran(unlocks) & kk: KEY | unlocks:=unlocks\/{kk|->dd} || keys:=keys\/{kk});
  Expanded_List_Substitution(Machine(Safes),removemaster)==(masterkey/=0 | masterkey:=0);
  Expanded_List_Substitution(Machine(Safes),insertmaster)==(kk: NAT & kk/=0 & masterkey = 0 | masterkey:=kk);
  Expanded_List_Substitution(Machine(Safes),quickcloseandlock)==(dd: DOOR & position(dd) = open | status:=status<+{dd|->locked} || position:=position<+{dd|->closed});
  Expanded_List_Substitution(Machine(Safes),quicklock)==(dd: DOOR & position(dd) = closed & dd: DOOR & position(dd) = closed & unlocks~(dd): KEY | status:=status<+{dd|->locked} || keys:=keys-{unlocks~(dd)});
  Expanded_List_Substitution(Machine(Safes),unlock)==(dd: DOOR & unlocks~(dd): keys & dd: DOOR & position(dd) = closed | status:=status<+{dd|->unlocked});
  Expanded_List_Substitution(Machine(Safes),extract)==(kk: KEY & dd: DOOR & unlocks(kk) = dd & status(dd) = locked & mk: NAT & mk = masterkey & kk: KEY | keys:=keys-{kk});
  Expanded_List_Substitution(Machine(Safes),insert)==(kk: KEY & dd: DOOR & unlocks(kk) = dd & mk: NAT & mk = masterkey & kk: KEY | keys:=keys\/{kk});
  List_Substitution(Machine(Safes),closedoor)==(position(dd):=closed);
  Expanded_List_Substitution(Machine(Safes),closedoor)==(dd: DOOR | position:=position<+{dd|->closed});
  List_Substitution(Machine(Safes),lockdoor)==(status(dd):=locked);
  Expanded_List_Substitution(Machine(Safes),lockdoor)==(dd: DOOR & position(dd) = closed | status:=status<+{dd|->locked});
  List_Substitution(Machine(Safes),opendoor)==(opening(dd));
  Expanded_List_Substitution(Machine(Safes),opendoor)==(dd: DOOR & status(dd) = unlocked | position:=position<+{dd|->open});
  List_Substitution(Machine(Safes),insert)==(insertkey(kk));
  List_Substitution(Machine(Safes),extract)==(removekey(kk));
  List_Substitution(Machine(Safes),unlock)==(unlockdoor(dd));
  List_Substitution(Machine(Safes),quicklock)==(lockdoor(dd) || removekey(unlocks~(dd)));
  List_Substitution(Machine(Safes),quickcloseandlock)==(quickclose(dd));
  List_Substitution(Machine(Safes),insertmaster)==(masterkey:=kk);
  List_Substitution(Machine(Safes),removemaster)==(masterkey:=0);
  List_Substitution(Machine(Safes),allocate)==(unlocks:=unlocks\/{kk|->dd} || insertkey(kk));
  List_Substitution(Machine(Safes),deallocate)==(unlocks:=unlocks-{kk|->dd} || removekey(kk))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Safes))==(?);
  Inherited_List_Constants(Machine(Safes))==(?);
  List_Constants(Machine(Safes))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Safes),KEY)==(?);
  Context_List_Enumerated(Machine(Safes))==(?);
  Context_List_Defered(Machine(Safes))==(?);
  Context_List_Sets(Machine(Safes))==(?);
  List_Valuable_Sets(Machine(Safes))==(DOOR,KEY);
  Inherited_List_Enumerated(Machine(Safes))==(STATUS,POSITION);
  Inherited_List_Defered(Machine(Safes))==(DOOR,KEY);
  Inherited_List_Sets(Machine(Safes))==(STATUS,DOOR,POSITION,KEY);
  List_Enumerated(Machine(Safes))==(?);
  List_Defered(Machine(Safes))==(?);
  List_Sets(Machine(Safes))==(?);
  Set_Definition(Machine(Safes),POSITION)==({open,closed});
  Set_Definition(Machine(Safes),STATUS)==({locked,unlocked});
  Set_Definition(Machine(Safes),DOOR)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Safes))==(?);
  Expanded_List_HiddenConstants(Machine(Safes))==(?);
  List_HiddenConstants(Machine(Safes))==(?);
  External_List_HiddenConstants(Machine(Safes))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Safes))==(btrue);
  Context_List_Properties(Machine(Safes))==(btrue);
  Inherited_List_Properties(Machine(Safes))==(STATUS: FIN(INTEGER) & not(STATUS = {}) & DOOR: FIN(INTEGER) & not(DOOR = {}) & POSITION: FIN(INTEGER) & not(POSITION = {}) & KEY: FIN(INTEGER) & not(KEY = {}));
  List_Properties(Machine(Safes))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Safes),closedoor)==(?);
  List_ANY_Var(Machine(Safes),lockdoor)==(?);
  List_ANY_Var(Machine(Safes),opendoor)==(?);
  List_ANY_Var(Machine(Safes),insert)==(?);
  List_ANY_Var(Machine(Safes),extract)==(?);
  List_ANY_Var(Machine(Safes),unlock)==(?);
  List_ANY_Var(Machine(Safes),quicklock)==(?);
  List_ANY_Var(Machine(Safes),quickcloseandlock)==(?);
  List_ANY_Var(Machine(Safes),insertmaster)==(?);
  List_ANY_Var(Machine(Safes),removemaster)==(?);
  List_ANY_Var(Machine(Safes),allocate)==(?);
  List_ANY_Var(Machine(Safes),deallocate)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Safes)) == (? | KEY,STATUS,locked,unlocked,DOOR,POSITION,open,closed | unlocks,masterkey | V,keys,status,V,position | insert,extract,unlock,quicklock,quickcloseandlock,insertmaster,removemaster,allocate,deallocate | opendoor,closedoor,lockdoor | included(Machine(Locks)),included(Machine(Keys)) | ? | Safes);
  List_Of_HiddenCst_Ids(Machine(Safes)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Safes)) == (?);
  List_Of_VisibleVar_Ids(Machine(Safes)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Safes)) == (?: ?);
  List_Of_Ids(Machine(Keys)) == (KEY | ? | keys | ? | insertkey,removekey | ? | ? | ? | Keys);
  List_Of_HiddenCst_Ids(Machine(Keys)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Keys)) == (?);
  List_Of_VisibleVar_Ids(Machine(Keys)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Keys)) == (?: ?);
  List_Of_Ids(Machine(Locks)) == (STATUS,locked,unlocked | DOOR,POSITION,open,closed | status | V,position | opendoor,unlockdoor,lockdoor,quickclose | closedoor | included(Machine(Doors)) | ? | Locks);
  List_Of_HiddenCst_Ids(Machine(Locks)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Locks)) == (?);
  List_Of_VisibleVar_Ids(Machine(Locks)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Locks)) == (?: ?);
  List_Of_Ids(Machine(Doors)) == (DOOR,POSITION,open,closed | ? | position | ? | opening,closedoor | ? | ? | ? | Doors);
  List_Of_HiddenCst_Ids(Machine(Doors)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Doors)) == (?);
  List_Of_VisibleVar_Ids(Machine(Doors)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Doors)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Safes)) == (Type(STATUS) == Cst(SetOf(etype(STATUS,0,1)));Type(DOOR) == Cst(SetOf(atype(DOOR,"[DOOR","]DOOR")));Type(POSITION) == Cst(SetOf(etype(POSITION,0,1)));Type(KEY) == Cst(SetOf(atype(KEY,"[KEY","]KEY"))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Safes)) == (Type(unlocked) == Cst(etype(STATUS,0,1));Type(locked) == Cst(etype(STATUS,0,1));Type(open) == Cst(etype(POSITION,0,1));Type(closed) == Cst(etype(POSITION,0,1)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Safes)) == (Type(status) == Mvl(SetOf(atype(DOOR,"[DOOR","]DOOR")*etype(STATUS,0,1)));Type(position) == Mvl(SetOf(atype(DOOR,"[DOOR","]DOOR")*etype(POSITION,0,1)));Type(keys) == Mvl(SetOf(atype(KEY,?,?)));Type(unlocks) == Mvl(SetOf(atype(KEY,?,?)*atype(DOOR,?,?)));Type(masterkey) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Safes)) == (Type(opendoor) == Cst(No_type,atype(DOOR,?,?));Type(closedoor) == Cst(No_type,atype(DOOR,?,?));Type(lockdoor) == Cst(No_type,atype(DOOR,?,?));Type(deallocate) == Cst(No_type,atype(KEY,?,?)*atype(DOOR,?,?));Type(allocate) == Cst(No_type,atype(KEY,?,?)*atype(DOOR,?,?));Type(removemaster) == Cst(No_type,No_type);Type(insertmaster) == Cst(No_type,btype(INTEGER,?,?));Type(quickcloseandlock) == Cst(No_type,atype(DOOR,?,?));Type(quicklock) == Cst(No_type,atype(DOOR,?,?));Type(unlock) == Cst(No_type,atype(DOOR,?,?));Type(extract) == Cst(No_type,atype(KEY,?,?)*atype(DOOR,?,?)*btype(INTEGER,?,?));Type(insert) == Cst(No_type,atype(KEY,?,?)*atype(DOOR,?,?)*btype(INTEGER,?,?)))
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
