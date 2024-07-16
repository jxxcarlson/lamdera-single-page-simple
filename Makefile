.PHONY: install uninstall deps

install:
	echo "Installing..."

deps:
	echo "Installing dependencies..."
	lamdera install elm/json
	lamdera install elm/time
	lamdera install mdgriffith/elm-ui
	lamdera install elmcraft/core-extra

uninstall:
	echo "Uninstalling..."
