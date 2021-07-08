/* Airport
 * Author: Franklin
 * Creation date: 04/10/2020
 */
MACHINE
    Airport

SETS
    DESTINATION ;
    PLANE ;
    PERSON ;
    TICKET ;
    TICKET_STATUS = { paid , checkin , board }

ABSTRACT_VARIABLES
    planes , flights , connections , passengers , tickets , ticket_to , has_ticket , tickets_status , capacities

INVARIANT
    /* Aviões presentes no aeroporto */
    planes <: PLANE &

    /* Destinos imediatos a partir do aeroporto */
    connections <: DESTINATION &

    /* Passageiros do aeroporto */
    passengers <: PERSON &

    /* Tickets para os voos */
    tickets <: TICKET &

    /* Voos que vão sair do aeroporto */
    flights : planes +-> connections &

    /* Relação que diz o avião do ticket */
    ticket_to : tickets --> planes &

    /* Status dos tickets */
    tickets_status : tickets --> TICKET_STATUS &

    /* Ticket do passageiro */
    has_ticket : passengers <-> tickets &

    dom ( ticket_to ) = dom ( tickets_status ) &

    /* As capacidades dos aviões */
    capacities : planes --> NAT1

INITIALISATION
    planes := {} ||
    flights := {} ||
    connections := {} ||
    passengers := {} ||
    tickets := {} ||
    tickets_status := {} ||
    capacities := {} ||
    ticket_to := {} ||
    has_ticket := {}

OPERATIONS

    new_connection ( dd ) =
        PRE dd : DESTINATION & dd /: connections
        THEN connections := connections \/ { dd }
        END ;

    plane_arrival ( pp ) =
        PRE pp : PLANE & pp /: planes & pp /: dom ( capacities )
        THEN planes := planes \/ { pp } ||
            SELECT
            pp : PLANE THEN capacities := capacities \/ { pp |-> 2 }
            WHEN pp : PLANE THEN capacities := capacities \/ { pp |-> 4 }
           END
        END ;

    plane_destination_flight ( pp , dd ) =
        PRE pp : PLANE & pp : planes &
            dd : DESTINATION & dd : connections &
            pp /: dom ( flights )
        THEN flights := flights \/ { pp |-> dd }
        END ;

    /*
     * A passagenger buys a ticket.
     * - inputs
     * |- pp: must be a person
     * |- dd: must be a destination
     * - actions
     * |- add the person to passengers
     * |- add a new ticket
     * |- add the ticket status
     * |- add the associated plane to the ticket
     * |- add the ticket to the passenger
     */
    buy_ticket ( pp , dd ) =
        PRE pp : PERSON &
            dd : DESTINATION & dd : connections &
            ( has_ticket ; ticket_to ) [ { pp } ] /\ flights ~ [ { dd } ] = {} &
            # xx . ( xx : planes & xx : flights ~ [ { dd } ] &
                 xx : dom ( capacities ) &
                 card ( ticket_to ~ [ { xx } ] ) < capacities ( xx ) )
        THEN passengers := passengers \/ { pp } ||
            ANY xx
            WHERE xx : dom ( flights ) & flights ( xx ) = dd &
                xx : dom ( capacities ) &
                card ( ticket_to ~ [ { xx } ] ) < capacities ( xx )
            THEN
                ANY tt
                WHERE tt : TICKET & tt /: tickets
                THEN tickets_status := tickets_status \/ { tt |-> paid } ||
                    ticket_to := ticket_to \/ { tt |-> xx } ||
                    has_ticket := has_ticket \/ { pp |-> tt } ||
                    tickets := tickets \/ { tt }
                END
            END
        END ;

    check_in ( pp , tt ) =
        PRE pp : PERSON & pp : passengers &
            tt : TICKET & tt : tickets &
            pp |-> tt : has_ticket &
            tt : dom ( tickets_status ) &
            tt : dom ( ticket_to ) &
            tickets_status ( tt ) = paid &
            { checkin , board } /\ ( has_ticket ; tickets_status ) [ { pp } ] = {}
        THEN tickets_status := tickets_status <+ { tt |-> checkin }
        END ;


    boarding ( pp , tt ) =
        PRE pp : PERSON & pp : passengers &
            tt : TICKET & tt : tickets &
            pp |-> tt : has_ticket &
            tt : dom ( tickets_status ) &
            tt : dom ( ticket_to ) &
            tickets_status ( tt ) = checkin
        THEN tickets_status := tickets_status <+ { tt |-> board }
        END ;

    plane_departure ( pp ) =
        PRE pp : PLANE & pp : planes &
            pp : dom ( flights ) &
            // no passenger has a ticket with paid or check in status
            ( ticket_to ~ ; tickets_status ) [ { pp } ] /\ { paid , checkin } = {} &
            pp : dom ( capacities ) &
            pp : ran ( ticket_to ) &
            { pp } <<| capacities : planes - { pp } --> NAT1
        THEN planes := planes - { pp } ||
            flights := { pp } <<| flights ||
            ticket_to := ticket_to |>> { pp } ||

            // removes flight ticket statuses for that plane
            tickets_status := ticket_to ~ [ { pp } ] <<| tickets_status ||

            // remove tickets
            tickets := tickets - ticket_to ~ [ { pp } ] ||
            capacities := { pp } <<| capacities ||

            // removes passenger tickets from the plane
            has_ticket := has_ticket |>> ticket_to ~ [ { pp } ] ||

            // removes passengers who have no other tickets
            passengers := passengers - ( ticket_to ~ ; has_ticket ~ ) [ { pp } ] \/ ran ( { pp } <<| ticket_to ~ ; has_ticket ~ )
        END ;

    realocate ( pp ) =
        PRE pp : PLANE & pp : planes & pp : dom ( flights ) &
            flights ( pp ) : ran ( { pp } <<| flights ) &
            ( paid : ( ticket_to ~ ; tickets_status ) [ { pp } ] or checkin : ( ticket_to ~ ; tickets_status ) [ { pp } ] ) &
            # xx . ( xx : planes & xx : dom ( flights ) & flights ( xx ) = flights ( pp ) &
                 xx : dom ( capacities ) &
                     capacities ( xx ) <
                     card ( ( ticket_to ~ [ { pp } ] /\ tickets_status ~ [ { paid , checkin } ] ) \/ ticket_to ~ [ { xx } ] )
                 )
        THEN
            ANY xx
            WHERE xx : PLANE & xx : planes &
                xx : dom ( flights ) & flights ( xx ) = flights ( pp ) &
                xx : dom ( capacities ) &
                capacities ( xx ) < card ( ( ticket_to ~ [ { pp } ] /\ tickets_status ~ [ { paid , checkin } ] ) \/ ticket_to ~ [ { xx } ] )
            THEN ticket_to := ( ticket_to ~ [ { pp } ] /\ tickets_status ~ [ { paid , checkin } ] ) <<| ticket_to \/
                ( ticket_to ~ [ { pp } ] /\ tickets_status ~ [ { paid , checkin } ] ) * { xx }
            END
        END ;

    realocate_passenger ( pp , tt ) =
        PRE pp : passengers & tt : tickets &
            pp |-> tt : has_ticket &
            tickets_status ( tt ) /= board
        THEN
            ANY xx
            WHERE xx : planes & xx : dom ( flights ) &
                flights [ { xx } ] = ( ticket_to ; flights ) [ { tt } ] &
                not ( xx = ticket_to ( tt ) )
            THEN ticket_to := ticket_to <+ { tt |-> xx }
            END
        END ;

    cancel_ticket ( tt ) =
        PRE tt : tickets &
            tt : ran ( has_ticket ) &
            tt : dom ( ticket_to ) &
            tickets_status ( tt ) /= board
        THEN tickets := tickets - { tt } ||
            ticket_to := { tt } <<| ticket_to ||
            tickets_status := { tt } <<| tickets_status ||
            has_ticket := has_ticket |>> { tt } ||
            passengers := passengers /\ dom ( has_ticket |>> { tt } )
        END

END
