#!/bin/bash

# Insère une nouvelle ligne
function insert_new_line() {
	echo ""
}

# Affiche une erreur
function display_error() {
	echo "Error: $1" >&2
	echo "The script will now close."
	echo "Please, open an Issue on GitHub (https://github.com/enioaiello/42-env) to help fix this problem!"
	exit 1 # Sort avec le code d'erreur 1
}

# Affiche un succès
function display_success() {
	echo "Success: $1"
}

# Affiche un avertissement
function display_warning() {
	echo "Warning: $1"
}

# Affiche une information
function display_info() {
	echo "Info: $1"
}
