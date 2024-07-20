.PHONY: install uninstall deps

base:
	echo "Replacing src with src-original..."
	cp -r src-original/. src/

add-pages:
	echo "Adding pages..."
	cp -r src-original/. src/
	npx elm-review src --fix-all

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
