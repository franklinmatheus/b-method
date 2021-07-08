Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Airport))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Airport))==(Machine(Airport));
  Level(Machine(Airport))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Airport)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Airport))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Airport))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Airport))==(?);
  List_Includes(Machine(Airport))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Airport))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Airport))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Airport))==(?);
  Context_List_Variables(Machine(Airport))==(?);
  Abstract_List_Variables(Machine(Airport))==(?);
  Local_List_Variables(Machine(Airport))==(capacities,tickets_status,has_ticket,ticket_to,tickets,passengers,connections,flights,planes);
  List_Variables(Machine(Airport))==(capacities,tickets_status,has_ticket,ticket_to,tickets,passengers,connections,flights,planes);
  External_List_Variables(Machine(Airport))==(capacities,tickets_status,has_ticket,ticket_to,tickets,passengers,connections,flights,planes)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Airport))==(?);
  Abstract_List_VisibleVariables(Machine(Airport))==(?);
  External_List_VisibleVariables(Machine(Airport))==(?);
  Expanded_List_VisibleVariables(Machine(Airport))==(?);
  List_VisibleVariables(Machine(Airport))==(?);
  Internal_List_VisibleVariables(Machine(Airport))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Airport))==(btrue);
  Gluing_List_Invariant(Machine(Airport))==(btrue);
  Expanded_List_Invariant(Machine(Airport))==(btrue);
  Abstract_List_Invariant(Machine(Airport))==(btrue);
  Context_List_Invariant(Machine(Airport))==(btrue);
  List_Invariant(Machine(Airport))==(planes <: PLANE & connections <: DESTINATION & passengers <: PERSON & tickets <: TICKET & flights: planes +-> connections & ticket_to: tickets --> planes & tickets_status: tickets --> TICKET_STATUS & has_ticket: passengers <-> tickets & dom(ticket_to) = dom(tickets_status) & capacities: planes --> NAT1)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Airport))==(btrue);
  Abstract_List_Assertions(Machine(Airport))==(btrue);
  Context_List_Assertions(Machine(Airport))==(btrue);
  List_Assertions(Machine(Airport))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Airport))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Airport))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Airport))==(planes,flights,connections,passengers,tickets,tickets_status,capacities,ticket_to,has_ticket:={},{},{},{},{},{},{},{},{});
  Context_List_Initialisation(Machine(Airport))==(skip);
  List_Initialisation(Machine(Airport))==(planes:={} || flights:={} || connections:={} || passengers:={} || tickets:={} || tickets_status:={} || capacities:={} || ticket_to:={} || has_ticket:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Airport))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Airport))==(btrue);
  List_Constraints(Machine(Airport))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Airport))==(new_connection,plane_arrival,plane_destination_flight,buy_ticket,check_in,boarding,plane_departure,realocate,realocate_passenger,cancel_ticket);
  List_Operations(Machine(Airport))==(new_connection,plane_arrival,plane_destination_flight,buy_ticket,check_in,boarding,plane_departure,realocate,realocate_passenger,cancel_ticket)
END
&
THEORY ListInputX IS
  List_Input(Machine(Airport),new_connection)==(dd);
  List_Input(Machine(Airport),plane_arrival)==(pp);
  List_Input(Machine(Airport),plane_destination_flight)==(pp,dd);
  List_Input(Machine(Airport),buy_ticket)==(pp,dd);
  List_Input(Machine(Airport),check_in)==(pp,tt);
  List_Input(Machine(Airport),boarding)==(pp,tt);
  List_Input(Machine(Airport),plane_departure)==(pp);
  List_Input(Machine(Airport),realocate)==(pp);
  List_Input(Machine(Airport),realocate_passenger)==(pp,tt);
  List_Input(Machine(Airport),cancel_ticket)==(tt)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Airport),new_connection)==(?);
  List_Output(Machine(Airport),plane_arrival)==(?);
  List_Output(Machine(Airport),plane_destination_flight)==(?);
  List_Output(Machine(Airport),buy_ticket)==(?);
  List_Output(Machine(Airport),check_in)==(?);
  List_Output(Machine(Airport),boarding)==(?);
  List_Output(Machine(Airport),plane_departure)==(?);
  List_Output(Machine(Airport),realocate)==(?);
  List_Output(Machine(Airport),realocate_passenger)==(?);
  List_Output(Machine(Airport),cancel_ticket)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Airport),new_connection)==(new_connection(dd));
  List_Header(Machine(Airport),plane_arrival)==(plane_arrival(pp));
  List_Header(Machine(Airport),plane_destination_flight)==(plane_destination_flight(pp,dd));
  List_Header(Machine(Airport),buy_ticket)==(buy_ticket(pp,dd));
  List_Header(Machine(Airport),check_in)==(check_in(pp,tt));
  List_Header(Machine(Airport),boarding)==(boarding(pp,tt));
  List_Header(Machine(Airport),plane_departure)==(plane_departure(pp));
  List_Header(Machine(Airport),realocate)==(realocate(pp));
  List_Header(Machine(Airport),realocate_passenger)==(realocate_passenger(pp,tt));
  List_Header(Machine(Airport),cancel_ticket)==(cancel_ticket(tt))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Airport),new_connection)==(dd: DESTINATION & dd/:connections);
  List_Precondition(Machine(Airport),plane_arrival)==(pp: PLANE & pp/:planes & pp/:dom(capacities));
  List_Precondition(Machine(Airport),plane_destination_flight)==(pp: PLANE & pp: planes & dd: DESTINATION & dd: connections & pp/:dom(flights));
  List_Precondition(Machine(Airport),buy_ticket)==(pp: PERSON & dd: DESTINATION & dd: connections & (has_ticket;ticket_to)[{pp}]/\flights~[{dd}] = {} & #xx.(xx: planes & xx: flights~[{dd}] & xx: dom(capacities) & card(ticket_to~[{xx}])<capacities(xx)));
  List_Precondition(Machine(Airport),check_in)==(pp: PERSON & pp: passengers & tt: TICKET & tt: tickets & pp|->tt: has_ticket & tt: dom(tickets_status) & tt: dom(ticket_to) & tickets_status(tt) = paid & {checkin,board}/\(has_ticket;tickets_status)[{pp}] = {});
  List_Precondition(Machine(Airport),boarding)==(pp: PERSON & pp: passengers & tt: TICKET & tt: tickets & pp|->tt: has_ticket & tt: dom(tickets_status) & tt: dom(ticket_to) & tickets_status(tt) = checkin);
  List_Precondition(Machine(Airport),plane_departure)==(pp: PLANE & pp: planes & pp: dom(flights) & (ticket_to~;tickets_status)[{pp}]/\{paid,checkin} = {} & pp: dom(capacities) & pp: ran(ticket_to) & {pp}<<|capacities: planes-{pp} --> NAT1);
  List_Precondition(Machine(Airport),realocate)==(pp: PLANE & pp: planes & pp: dom(flights) & flights(pp): ran({pp}<<|flights) & (paid: (ticket_to~;tickets_status)[{pp}] or checkin: (ticket_to~;tickets_status)[{pp}]) & #xx.(xx: planes & xx: dom(flights) & flights(xx) = flights(pp) & xx: dom(capacities) & capacities(xx)<card(ticket_to~[{pp}]/\tickets_status~[{paid,checkin}]\/ticket_to~[{xx}])));
  List_Precondition(Machine(Airport),realocate_passenger)==(pp: passengers & tt: tickets & pp|->tt: has_ticket & tickets_status(tt)/=board);
  List_Precondition(Machine(Airport),cancel_ticket)==(tt: tickets & tt: ran(has_ticket) & tt: dom(ticket_to) & tickets_status(tt)/=board)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Airport),cancel_ticket)==(tt: tickets & tt: ran(has_ticket) & tt: dom(ticket_to) & tickets_status(tt)/=board | tickets,ticket_to,tickets_status,has_ticket,passengers:=tickets-{tt},{tt}<<|ticket_to,{tt}<<|tickets_status,has_ticket|>>{tt},passengers/\dom(has_ticket|>>{tt}));
  Expanded_List_Substitution(Machine(Airport),realocate_passenger)==(pp: passengers & tt: tickets & pp|->tt: has_ticket & tickets_status(tt)/=board | @xx.(xx: planes & xx: dom(flights) & flights[{xx}] = (ticket_to;flights)[{tt}] & not(xx = ticket_to(tt)) ==> ticket_to:=ticket_to<+{tt|->xx}));
  Expanded_List_Substitution(Machine(Airport),realocate)==(pp: PLANE & pp: planes & pp: dom(flights) & flights(pp): ran({pp}<<|flights) & (paid: (ticket_to~;tickets_status)[{pp}] or checkin: (ticket_to~;tickets_status)[{pp}]) & #xx.(xx: planes & xx: dom(flights) & flights(xx) = flights(pp) & xx: dom(capacities) & capacities(xx)<card(ticket_to~[{pp}]/\tickets_status~[{paid,checkin}]\/ticket_to~[{xx}])) | @xx.(xx: PLANE & xx: planes & xx: dom(flights) & flights(xx) = flights(pp) & xx: dom(capacities) & capacities(xx)<card(ticket_to~[{pp}]/\tickets_status~[{paid,checkin}]\/ticket_to~[{xx}]) ==> ticket_to:=ticket_to~[{pp}]/\tickets_status~[{paid,checkin}]<<|ticket_to\/(ticket_to~[{pp}]/\tickets_status~[{paid,checkin}])*{xx}));
  Expanded_List_Substitution(Machine(Airport),plane_departure)==(pp: PLANE & pp: planes & pp: dom(flights) & (ticket_to~;tickets_status)[{pp}]/\{paid,checkin} = {} & pp: dom(capacities) & pp: ran(ticket_to) & {pp}<<|capacities: planes-{pp} --> NAT1 | planes,flights,ticket_to,tickets_status,tickets,capacities,has_ticket,passengers:=planes-{pp},{pp}<<|flights,ticket_to|>>{pp},ticket_to~[{pp}]<<|tickets_status,tickets-ticket_to~[{pp}],{pp}<<|capacities,has_ticket|>>ticket_to~[{pp}],passengers-(ticket_to~;has_ticket~)[{pp}]\/ran({pp}<<|ticket_to~;has_ticket~));
  Expanded_List_Substitution(Machine(Airport),boarding)==(pp: PERSON & pp: passengers & tt: TICKET & tt: tickets & pp|->tt: has_ticket & tt: dom(tickets_status) & tt: dom(ticket_to) & tickets_status(tt) = checkin | tickets_status:=tickets_status<+{tt|->board});
  Expanded_List_Substitution(Machine(Airport),check_in)==(pp: PERSON & pp: passengers & tt: TICKET & tt: tickets & pp|->tt: has_ticket & tt: dom(tickets_status) & tt: dom(ticket_to) & tickets_status(tt) = paid & {checkin,board}/\(has_ticket;tickets_status)[{pp}] = {} | tickets_status:=tickets_status<+{tt|->checkin});
  Expanded_List_Substitution(Machine(Airport),buy_ticket)==(pp: PERSON & dd: DESTINATION & dd: connections & (has_ticket;ticket_to)[{pp}]/\flights~[{dd}] = {} & #xx.(xx: planes & xx: flights~[{dd}] & xx: dom(capacities) & card(ticket_to~[{xx}])<capacities(xx)) | passengers:=passengers\/{pp} || @xx.(xx: dom(flights) & flights(xx) = dd & xx: dom(capacities) & card(ticket_to~[{xx}])<capacities(xx) ==> @tt.(tt: TICKET & tt/:tickets ==> tickets_status,ticket_to,has_ticket,tickets:=tickets_status\/{tt|->paid},ticket_to\/{tt|->xx},has_ticket\/{pp|->tt},tickets\/{tt})));
  Expanded_List_Substitution(Machine(Airport),plane_destination_flight)==(pp: PLANE & pp: planes & dd: DESTINATION & dd: connections & pp/:dom(flights) | flights:=flights\/{pp|->dd});
  Expanded_List_Substitution(Machine(Airport),plane_arrival)==(pp: PLANE & pp/:planes & pp/:dom(capacities) | planes:=planes\/{pp} || (pp: PLANE ==> capacities:=capacities\/{pp|->2} [] pp: PLANE ==> capacities:=capacities\/{pp|->4}));
  Expanded_List_Substitution(Machine(Airport),new_connection)==(dd: DESTINATION & dd/:connections | connections:=connections\/{dd});
  List_Substitution(Machine(Airport),new_connection)==(connections:=connections\/{dd});
  List_Substitution(Machine(Airport),plane_arrival)==(planes:=planes\/{pp} || SELECT pp: PLANE THEN capacities:=capacities\/{pp|->2} WHEN pp: PLANE THEN capacities:=capacities\/{pp|->4} END);
  List_Substitution(Machine(Airport),plane_destination_flight)==(flights:=flights\/{pp|->dd});
  List_Substitution(Machine(Airport),buy_ticket)==(passengers:=passengers\/{pp} || ANY xx WHERE xx: dom(flights) & flights(xx) = dd & xx: dom(capacities) & card(ticket_to~[{xx}])<capacities(xx) THEN ANY tt WHERE tt: TICKET & tt/:tickets THEN tickets_status:=tickets_status\/{tt|->paid} || ticket_to:=ticket_to\/{tt|->xx} || has_ticket:=has_ticket\/{pp|->tt} || tickets:=tickets\/{tt} END END);
  List_Substitution(Machine(Airport),check_in)==(tickets_status:=tickets_status<+{tt|->checkin});
  List_Substitution(Machine(Airport),boarding)==(tickets_status:=tickets_status<+{tt|->board});
  List_Substitution(Machine(Airport),plane_departure)==(planes:=planes-{pp} || flights:={pp}<<|flights || ticket_to:=ticket_to|>>{pp} || tickets_status:=ticket_to~[{pp}]<<|tickets_status || tickets:=tickets-ticket_to~[{pp}] || capacities:={pp}<<|capacities || has_ticket:=has_ticket|>>ticket_to~[{pp}] || passengers:=passengers-(ticket_to~;has_ticket~)[{pp}]\/ran({pp}<<|ticket_to~;has_ticket~));
  List_Substitution(Machine(Airport),realocate)==(ANY xx WHERE xx: PLANE & xx: planes & xx: dom(flights) & flights(xx) = flights(pp) & xx: dom(capacities) & capacities(xx)<card(ticket_to~[{pp}]/\tickets_status~[{paid,checkin}]\/ticket_to~[{xx}]) THEN ticket_to:=ticket_to~[{pp}]/\tickets_status~[{paid,checkin}]<<|ticket_to\/(ticket_to~[{pp}]/\tickets_status~[{paid,checkin}])*{xx} END);
  List_Substitution(Machine(Airport),realocate_passenger)==(ANY xx WHERE xx: planes & xx: dom(flights) & flights[{xx}] = (ticket_to;flights)[{tt}] & not(xx = ticket_to(tt)) THEN ticket_to:=ticket_to<+{tt|->xx} END);
  List_Substitution(Machine(Airport),cancel_ticket)==(tickets:=tickets-{tt} || ticket_to:={tt}<<|ticket_to || tickets_status:={tt}<<|tickets_status || has_ticket:=has_ticket|>>{tt} || passengers:=passengers/\dom(has_ticket|>>{tt}))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Airport))==(?);
  Inherited_List_Constants(Machine(Airport))==(?);
  List_Constants(Machine(Airport))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Airport),DESTINATION)==(?);
  Context_List_Enumerated(Machine(Airport))==(?);
  Context_List_Defered(Machine(Airport))==(?);
  Context_List_Sets(Machine(Airport))==(?);
  List_Valuable_Sets(Machine(Airport))==(DESTINATION,PLANE,PERSON,TICKET);
  Inherited_List_Enumerated(Machine(Airport))==(?);
  Inherited_List_Defered(Machine(Airport))==(?);
  Inherited_List_Sets(Machine(Airport))==(?);
  List_Enumerated(Machine(Airport))==(TICKET_STATUS);
  List_Defered(Machine(Airport))==(DESTINATION,PLANE,PERSON,TICKET);
  List_Sets(Machine(Airport))==(DESTINATION,PLANE,PERSON,TICKET,TICKET_STATUS);
  Set_Definition(Machine(Airport),PLANE)==(?);
  Set_Definition(Machine(Airport),PERSON)==(?);
  Set_Definition(Machine(Airport),TICKET)==(?);
  Set_Definition(Machine(Airport),TICKET_STATUS)==({paid,checkin,board})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Airport))==(?);
  Expanded_List_HiddenConstants(Machine(Airport))==(?);
  List_HiddenConstants(Machine(Airport))==(?);
  External_List_HiddenConstants(Machine(Airport))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Airport))==(btrue);
  Context_List_Properties(Machine(Airport))==(btrue);
  Inherited_List_Properties(Machine(Airport))==(btrue);
  List_Properties(Machine(Airport))==(DESTINATION: FIN(INTEGER) & not(DESTINATION = {}) & PLANE: FIN(INTEGER) & not(PLANE = {}) & PERSON: FIN(INTEGER) & not(PERSON = {}) & TICKET: FIN(INTEGER) & not(TICKET = {}) & TICKET_STATUS: FIN(INTEGER) & not(TICKET_STATUS = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Airport),new_connection)==(?);
  List_ANY_Var(Machine(Airport),plane_arrival)==(?);
  List_ANY_Var(Machine(Airport),plane_destination_flight)==(?);
  List_ANY_Var(Machine(Airport),buy_ticket)==((Var(xx) == atype(PLANE,?,?)),(Var(tt) == atype(TICKET,?,?)));
  List_ANY_Var(Machine(Airport),check_in)==(?);
  List_ANY_Var(Machine(Airport),boarding)==(?);
  List_ANY_Var(Machine(Airport),plane_departure)==(?);
  List_ANY_Var(Machine(Airport),realocate)==(Var(xx) == atype(PLANE,?,?));
  List_ANY_Var(Machine(Airport),realocate_passenger)==(Var(xx) == atype(PLANE,?,?));
  List_ANY_Var(Machine(Airport),cancel_ticket)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Airport)) == (DESTINATION,PLANE,PERSON,TICKET,TICKET_STATUS,paid,checkin,board | ? | capacities,tickets_status,has_ticket,ticket_to,tickets,passengers,connections,flights,planes | ? | new_connection,plane_arrival,plane_destination_flight,buy_ticket,check_in,boarding,plane_departure,realocate,realocate_passenger,cancel_ticket | ? | ? | ? | Airport);
  List_Of_HiddenCst_Ids(Machine(Airport)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Airport)) == (?);
  List_Of_VisibleVar_Ids(Machine(Airport)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Airport)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Airport)) == (Type(DESTINATION) == Cst(SetOf(atype(DESTINATION,"[DESTINATION","]DESTINATION")));Type(PLANE) == Cst(SetOf(atype(PLANE,"[PLANE","]PLANE")));Type(PERSON) == Cst(SetOf(atype(PERSON,"[PERSON","]PERSON")));Type(TICKET) == Cst(SetOf(atype(TICKET,"[TICKET","]TICKET")));Type(TICKET_STATUS) == Cst(SetOf(etype(TICKET_STATUS,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Airport)) == (Type(paid) == Cst(etype(TICKET_STATUS,0,2));Type(checkin) == Cst(etype(TICKET_STATUS,0,2));Type(board) == Cst(etype(TICKET_STATUS,0,2)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Airport)) == (Type(capacities) == Mvl(SetOf(atype(PLANE,?,?)*btype(INTEGER,1,MAXINT)));Type(tickets_status) == Mvl(SetOf(atype(TICKET,?,?)*etype(TICKET_STATUS,0,2)));Type(has_ticket) == Mvl(SetOf(atype(PERSON,?,?)*atype(TICKET,?,?)));Type(ticket_to) == Mvl(SetOf(atype(TICKET,?,?)*atype(PLANE,?,?)));Type(tickets) == Mvl(SetOf(atype(TICKET,?,?)));Type(passengers) == Mvl(SetOf(atype(PERSON,?,?)));Type(connections) == Mvl(SetOf(atype(DESTINATION,?,?)));Type(flights) == Mvl(SetOf(atype(PLANE,?,?)*atype(DESTINATION,?,?)));Type(planes) == Mvl(SetOf(atype(PLANE,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Airport)) == (Type(cancel_ticket) == Cst(No_type,atype(TICKET,?,?));Type(realocate_passenger) == Cst(No_type,atype(PERSON,?,?)*atype(TICKET,?,?));Type(realocate) == Cst(No_type,atype(PLANE,?,?));Type(plane_departure) == Cst(No_type,atype(PLANE,?,?));Type(boarding) == Cst(No_type,atype(PERSON,?,?)*atype(TICKET,?,?));Type(check_in) == Cst(No_type,atype(PERSON,?,?)*atype(TICKET,?,?));Type(buy_ticket) == Cst(No_type,atype(PERSON,?,?)*atype(DESTINATION,?,?));Type(plane_destination_flight) == Cst(No_type,atype(PLANE,?,?)*atype(DESTINATION,?,?));Type(plane_arrival) == Cst(No_type,atype(PLANE,?,?));Type(new_connection) == Cst(No_type,atype(DESTINATION,?,?)))
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
