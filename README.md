
# Demo: jxxcarlson/elm-review-codeinstaller

This base version of this application is Lamdera app with two 
pages, Home and Notes.  To run it do this:

```zshrc
mkdir src       # only need to this once
make deps       # install the dependencies, only need to this once
make base       # copy the app from src-original
lamdera live    # run the app
```

# Add some pages

```
make add-pages
```

You should see two new pages, `Jokes` and `Quotes`.

# Return app to its initial state

```
make base
```

# Notes

- The code for the pages is in `vendor/Pages`

- At the moment we do not have an elm-review rule to update the value

```
routesAndNames : List ( Route, String )
routesAndNames =
    [ ( NotesRoute, "notes" ) ]
```

which must become

```
routesAndNames : List ( Route, String )
routesAndNames =
    [ ( NotesRoute, "notes" ), (JokesRoute, "jokes"), (QuotesRoute, "quotes") ]
```

Instead we hack a solution with a `sed` script (see clause add-pages of the Makefile).
This hack will be corrected in a day or two via a rule something like this:

```
Install.AddToList.config "Routes" "routesAndNames" 
   [ ("JokesRoute" "\"jokes\""), ("QuotesRoute", "\"quotes\"") ]
```

