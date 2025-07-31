module TicketPlease exposing (..)

import TicketPleaseSupport exposing (Status(..), Ticket(..), User(..))


emptyComment : ( User, String ) -> Bool
emptyComment t =
    case t of
        ( _, "" ) ->
            True

        _ ->
            False


numberOfCreatorComments : Ticket -> Int
numberOfCreatorComments (Ticket t) =
    let
        ( User createdBy, _ ) =
            t.createdBy
    in
    t.comments
        |> List.filter (\( User u, _ ) -> u == createdBy)
        |> List.length


assignedToDevTeam : Ticket -> Bool
assignedToDevTeam (Ticket { assignedTo }) =
    case assignedTo of
        Nothing ->
            False

        Just (User u) ->
            List.member u [ "Alice", "Bob", "Charlie" ]


assignTicketTo : User -> Ticket -> Ticket
assignTicketTo user ((Ticket t) as ticket) =
    case t.status of
        Archived ->
            ticket

        New ->
            Ticket { t | status = InProgress, assignedTo = Just user }

        _ ->
            Ticket { t | assignedTo = Just user }
