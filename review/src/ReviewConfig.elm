module ReviewConfig exposing (config)

{-| Do not rename the ReviewConfig module or the config function, because
`elm-review` will look for these.

To add packages that contain rules, add them to this review project using

    `elm install author/packagename`

when inside the directory containing this file.

-}

import Review.Rule exposing (Rule)
import Install.TypeVariant as TypeVariant
import Install.ClauseInCase as ClauseInCase
import Install.Import as Import
import String.Extra
import Install.ElementToList as ElementToList


config : List Rule
config =
   addPages [ "quotes", "jokes"]

addPages : List String -> List Rule
addPages pageNames =
    List.concatMap addPage pageNames

addPage : String -> List Rule
addPage page =
   let
    routeTitle = String.Extra.toTitleCase page
    routeName = routeTitle ++ "Route"

   in
    [
      TypeVariant.makeRule "Route" "Route" [ routeName ]
    , ClauseInCase.config "View.Main" "loadedView" routeName ("generic model Pages." ++ (routeTitle) ++ ".view") |> ClauseInCase.makeRule
    , Import.qualified "View.Main" ["Pages." ++ routeTitle] |> Import.makeRule
     ElementToList.makeRule "Route" "routesAndNames" [ "( JokesRoute, \"jokes\" )", "( QuotesRoute, \"quotes\" )"]
    ]

