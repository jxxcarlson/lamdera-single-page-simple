.PHONY: install uninstall deps

install:
	echo "Installing..."

deps:
	echo "Installing dependencies..."
	lamdera install elm/json
	lamdera install elm/time
	lamdera install mdgriffith/elm-ui

uninstall:
	echo "Uninstalling..."
