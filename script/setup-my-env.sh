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
	pause '$1'
}


# Affiche l'écran de bienvenue
function welcome_screen() {
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
	insert_new_line
	echo "This script will setup this environment for you."
	echo "Don't worry, the process is quick and simple."
	echo "After that, your environment will be ready and you can work immediately."
	insert_new_line
	echo -e "\e[0;31mWarning!"
	echo -e "\e[0;31mThis project is made for educationnal purpose only. I am not responsible for any cheating or misuse. This project is intended for people who are retrying their piscine or for those who are simply curious. The environment has been recreated as accurately as possible so that users don't get lost while studying."
	insert_new_line
	wait_input "When you are ready, please use any key to proceed."
}
