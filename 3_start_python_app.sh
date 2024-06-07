echo -e "\e[34m
Démarrage du socket docker ...
\e[0m"
# Start Docker socket service
systemctl start docker.socket
# all echo BLUE
echo -e "\e[34m
INFO: Activation du container docker SQL + PHPMyAdmin ...
"
# Navigate to the docker directory and bring up the services
cd Docker && sudo docker compose up -d

echo -e "\e[34m
INFO: Démarrage de l'environnement python ...
"
cd ../python_project/164_films_om
source .venv/bin/activate

echo -e "\e[34m
INFO: Démarrage de l'application avec le script python originel ...
\e[0m"
python run_mon_app.py
