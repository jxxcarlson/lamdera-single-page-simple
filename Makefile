.PHONY: install uninstall deps

base:
	echo "Replacing src with src-original..."
	cp -r src-original/. src/

add-page:
	echo "Adding page..."
	cp -r src-original/. src/
    # run the rule set


deps:
	echo "Installing dependencies..."
	lamdera install elm/json
	lamdera install elm/time
	lamdera install mdgriffith/elm-ui
	lamdera install elmcraft/core-extra

update-original:
	echo "Updating src-original ..."
	cp -r src/. src-original/

uninstall:
	echo "Uninstalling..."
