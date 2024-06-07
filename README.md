# mostoslavski_david_DEVA1A

## Le projet en bref:

Le but du projet et de vous permettre dans lancer votre application python
flask depuis un environement WSL (windows linux subsystem).

Le tout est automatisé au plus que possible.

## Comment faire

### Installation automatisée de WSL
1. Ouvrez un terminal powershell en ADMINISTRATEUR
2. Entrez la commande ```Set-ExecutionPolicy Unrestricted -Scope CurrentUser```
Nous allons désactiver cette option plus tard pour éviter que votre PC soit
exposé
3. lancez le premier script ``` 1_install_WSL.ps1 ```
Voici ce que fait ce script en bref:
    - Vérifie que vous la virtualisation dans le BIOS est activée
    - Vérifie que vous avez lancé le script en tant qu'ADMINISTRATEUR
    - Vérifie si la configuration de virtualisation est active
    - Vérifie si wsl est déjà installé avec Ubuntu
    - Install WSL Ubuntu dans le cas échéant
4. Redémmarez votre PC si cela est demandé et relancez le script une deuxieme fois
5. Vérifiez avec `Win+S` si l'application "Ubuntu" est correctement installée
6. Ouvrez un termnial Ubuntu avec l'une de ces deux possibilité:
    - L'application Ubuntu.exe
    - Ouvrez n'importe quel terminal windows (cmd,powershell,etc..) et entrez la commande ```wsl```
Si vous avez une erreur ressemblant à ça:
```
installing, this may take a fey minutes...
WslRegisterDistribution failed with error: 0x...
Error 0x..

```
C'est que vous n'avez pas redémarré votre ordinateur. Essayez à nouveau.
Si cela ne suffit pas: contactez moi.

7. Configurez votre nom d'utilisateur et un mot de passe en suivant les indications
dans le terminal WSL.
8. Entrez la commande ```Set-ExecutionPolicy RemoteSigned -Scope CurrentUser```
pour réduire les risques liés au script powershells que l'on a provoqués au début de l'installation.

### Installation de l'environement de developpement dans WSL

#### Quelques petits points importants
- WSL utilise l'environement terminal linux Ubuntu par défaut (donc avec BASH)
- WSL n'a pas la possibilité d'accèder directement à l'écran windows par défaut. Donc pas de GUI.
- WSL communique avec les mêmes ports que windows.
- WSL peut accéder à vos fichiers windows comme si il étaient dans un disque dur externe et/ou une clé USB
    Pour trouver votre disque ```C:/```, il vous faut aller dans ```/mnt/c/```.
    Votre dossier Downloads est donc dans ```/mnt/c/Users/VOTRE_USERNAME/Downloads```
- WSL Ubuntu préinstalle le meilleur editeur de texte disponible dans l'univers entier:
VIM. Vous n'avez plus aucune excuse pour ne pas essayer cette merveille.

#### Installation automatisée des dépendances

Liste des dépendences:
- Docker
- Python3
- Pip

1. Dans le root du dossier de mon projet, entrez la commande ```chmod +x 2_python_project_setup.sh```
pour transformer le script en un executable bash.
2. Lancez le script avec la commande ```./2_python_project_setup.sh``` depuis le root
de du dossier téléchargé. ```./``` est un préfix pour lancer un executable.
3. Suivez les indications fournie par le script. Voici le fonctionnement en bref:
- Vous demande un acces élevé
- Met à jour apt (gestionnaire de paquets bash Ubuntu)
- Installe Docker et ses dépendances
- Installe Docker-compose
- Rend executable le script de docker-compose. Nous permet d'utiliser la commande ```docker-compose up -d```
- Rend executable 3_start_python_app.sh automatiquement.
- Démarre le dernier script automatiquement.

## Lancer l'application après le setup

Lancez simplement le 3ème script avec la commande ```./3_start_python_project```
et le tour est joué

### URL localhost du projet

phpmyadmin  : http://localhost:8080
Votre site  : 127.x.x.x:5556 (L'adresse est précisée à la fin de l'execution du 3ème script)
