module Route exposing (Route(..), decode, encode)

import List.Extra
import Url exposing (Url)
import Url.Builder
import Url.Parser


type Route
    = HomepageRoute
    | NotesRoute


routesAndNames : List ( Route, String )
routesAndNames =
    [ ( NotesRoute, "notes" ) ]


parserData : List (Url.Parser.Parser (Route -> c) c)
parserData =
    List.map (\( route, name ) -> Url.Parser.s name |> Url.Parser.map route) routesAndNames


case1 : Route -> List String
case1 route =
    List.Extra.find (\( r, name ) -> r == route) routesAndNames
        |> Maybe.map Tuple.second
        |> Maybe.map (\name -> [ name ])
        |> Maybe.withDefault []


decode : Url -> Route
decode url =
    Url.Parser.oneOf
        ((Url.Parser.top |> Url.Parser.map HomepageRoute) :: parserData)
        |> (\a -> Url.Parser.parse a url |> Maybe.withDefault HomepageRoute)


{-| Create an absolute URL:

    absolute [] []
    -- "/"

    absolute [ "packages", "elm", "core" ] []
    -- "/packages/elm/core"

    absolute [ "blog", String.fromInt 42 ] []
    -- "/blog/42"

    absolute [ "products" ] [ string "search" "hat", int "page" 2 ]
    -- "/products?search=hat&page=2"

Notice that the URLs start with a slash!

-}
encode : Route -> String
encode route =
    Url.Builder.absolute
        --(case route of
        --    HomepageRoute ->
        --        []
        --
        --    NotesRoute ->
        --        [ "notes" ]
        --)
        (case1 route)
        []
