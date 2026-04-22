#!/bin/bash

# Définitions des variables globales
username=""
password=""

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

# Demande une information
function ask_user_prompt() {
	read -p "$1" $2
	echo "$3"
}

# Nettoyage de la fenêtre
function clear_window() {
	clear
	insert_new_line
}

# Attend une interaction de l'utilisateur
function wait_input() {
	pause
}

clear_window
echo "/* ************************************************************************** */"
echo "/*                                                                            */"
echo "/*                                                        :::      ::::::::   */"
echo "/*                                                      :+:      :+:    :+:   */"
echo "/*                                                    +:+ +:+         +:+     */"
echo "/*   Welcome to                                     +#+  +:+       +#+        */"
echo "/*   42-env                                       +#+#+#+#+#+   +#+           */"
echo "/*   Created by enio                                   #+#    #+#             */"
echo "/*   https://github.com/enioaiello/42-env             ###   ########          */"
echo "/*                                                                            */"
echo "/* ************************************************************************** */"
