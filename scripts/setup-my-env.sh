#!/bin/bash

# Définitions des variables globales
username=""
password=""
error=0

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
	echo "$1"
	while true; do
		read -rsn1 key  # Ecoute un input de manière silencieuse
		if [[ -n "$key" ]]; then
			$2
		fi
	done
}

# Enregistre un mot de passe
function insert_password() {
	echo "Nice to meet you $username!"
        echo "You'll need a password to continue, here is the password rules:"
        echo "  - Up to 4 characters"
        echo "  - No empty password"
        insert_new_line
        echo "Caution! Your password is visible."
        insert_new_line
        ask_user_prompt "Enter a password: " password

# Enregistre un nom d'utilisateur
function insert_username() {
	clear_window
	echo "Before we can continue, please tell us your username and your password for this virtual machine."
	echo "Here's the username rules:"
	echo "  - Up to 4 characters"
	echo "  - Only letters, dots and underscores"
	if [ $error = 1 ] # Note for me: this is a POSIX compatible instruction.
		echo "Please enter a valid username."
	fi
	ask_user_prompt "Enter a username (e.g. enio.aiello): " username
	if [ -z $username ]
		error = 1
		insert_username
	else
		error = 0
		insert_password
	fi
}

# Affiche l'écran de collecte de paramètres
function collect_screen() {
	clear_window
	insert_new_line
	insert_username
}

# Télécharge et installe la dernière version du 42header
function install_header() {
	clear_window
	echo "Please wait while 42header is being downloaded and installed."
	echo "When installed, use F1 key to insert the header while in preview mode with vim to insert the header."
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
	echo "/*                                                +#+#+#+#+#+   +#+           */"
	echo "/*   Created by enioaiello                             #+#    #+#             */"
	echo "/*   https://github.com/enioaiello/42-env             ###   ######## -env     */"
	echo "/*                                                                            */"
	echo "/* ************************************************************************** */"
	insert_new_line
	echo "This script will setup this environment for you."
	echo "Don't worry, the process is quick and simple."
	echo "After that, your environment will be ready and you can work immediately."
	insert_new_line
	echo -e "\e[0;31mWarning!"
	echo -e "\e[0;31mThis project is made for educationnal purpose only. I am not responsible for any cheating or misuse. This project is intended for people who are retrying their piscine or for those who are simply curious. The environment has been recreated as accurately as possible so that users don't get lost while studying."
	echo -e "\e[0m"
	insert_new_line
	wait_input "When you are ready, please use any key to proceed." collect_screen
}

welcome_screen # Appel la fonction qui démarre le script
