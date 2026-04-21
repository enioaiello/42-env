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

# Insère une nouvelle ligne dans le fichier de log avec le contenu demandé et l'heure
function insert_log() {
	local log_message="$1" # Définit la variable log_message avec le message demandé
	local log_file="./output.log" # Définit la localisation du fichier log
	echo "$(date '+%Y-%m-%d %H:%M:%S') - $log_message" >> "$log_file"
}
