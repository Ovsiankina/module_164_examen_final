#!/bin/bash

echo -e "\e[34m
# Il vous faudra rentrer votre mot de passe admin
# (normalement le même que votre session WSL Ubuntu)
\e[0m"

echo -e "\e[34m
# Mise à jour de la base de donnée des paquets
\e[0m"
# Update package database
sudo apt-get update

echo -e "\e[34m
# Installation des dépendances
\e[0m"
# Install required packages
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
echo -e "\e[34m
# curl est une commande très puissante permettant de télécharger depuis internet des trucs
\e[0m"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo -e "\e[34m
# Bon.. je vais pas tout expliquer non plus..
# Pressez sur enter quand cela vous est demandé
\e[0m"
# Add Docker's official APT repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the package database with Docker packages from the newly added repo
# Ensure that docker is accounted for
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce

echo -e "\e[34m
# Installation de Docker compose
# Un module docker qui permet de run des containers customs locaux
# Dans ce cas, on utilise le .yaml dans le dossier 'Docker/'
\e[0m"
# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo -e "\e[34m
# On rend executable le script docker par bash
# Amusez à 'cd /' pour explorer le coeur de Linux.
# Les dossiers sont très bien organisés par rapport à Windows
\e[0m"
# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

sudo chmod +x 3_start_python_app.sh
echo -e "\e[34m
# Lancement automatique du 3ème et dernier script.
\e[0m"
./3_start_python_app.sh
