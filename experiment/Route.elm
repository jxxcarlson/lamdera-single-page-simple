module Route exposing (Route(..), routesAndNames)

type Route
    = HomepageRoute
    | NotesRoute
    | JokesRoute
    | QuotesRoute

routesAndNames : List ( Route, String )
routesAndNames =
    [ ( NotesRoute, "notes" )]

foo : List String
foo = [ "bar" ]



