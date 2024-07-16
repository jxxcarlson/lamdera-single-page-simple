.PHONY: install uninstall deps

install:
	echo "Replacing src with src-original..."
	cp -r src-original/. src/

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
