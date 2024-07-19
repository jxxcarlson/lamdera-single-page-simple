.PHONY: install uninstall deps

base:
	echo "Replacing src with src-original..."
	cp -r src-original/. src/

add-pages:
	echo "Adding pages..."
	cp -r src-original/. src/
	# sed 's/\(\[ *( *NotesRoute, *"notes" *) *\)\(.*\)\(]\)/\1, ( JokesRoute, "jokes" ), ( QuotesRoute, "quotes" ) \3/' src/Route.elm > temp && mv temp src/Route.elm
	npx elm-review --fix-all


sed:
	echo "Running sed ..."
	# sed 's/\(.*\)\(]\)/\1, (JokesRoute, "jokes"), (QuotesRoute, "quotes") \2/' src/Route.elm > temp && mv temp src/Route.elm
	cp -r src-original/. src/
	sed 's/\(.*\)\(]\)/\1, (JokesRoute, "jokes"), (QuotesRoute, "quotes") \2/' src/Route.elm > temp && mv temp src/Route.elm

deps:
	echo "Installing dependencies..."
	lamdera install elm/json
	lamdera install elm/time
	lamdera install mdgriffith/elm-ui
	lamdera install elmcraft/core-extra

update-original:
	echo "Updating src-original ..."
	cp -r src/. src-original/

copy-src:
	cp -r src/.  src-copy/

uninstall:
	echo "Uninstalling..."
