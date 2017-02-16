Ce site web est utilisé pour un projet de fin d'étude avec HSBC.
Il contient une API permettant de gérer les intents et utterances nécessaire au machine learning d'un chat bot.


# Mise en place de la base de données et du site sur heroku

* Créer un fork du projet https://github.com/LouisPouillot/HSBC_WEBSITE sur votre github
* Se créer un compte sur https://www.heroku.com/ (avec une adresse mail valide)
* Une fois le mail vérifié et connecté, cliquez sur Create a new App
* Choisir un nom pour l’application
* Pour la méthode de déploiement sélectionner GitHub et connectez vous sur Github et autorisez les accès si nécessaire
* Une fois le compte heroku lié à Github sélectionné le repo que vous avez fork
* Déployez la branche master
* Dans l’onglet Ressources, sous le titre Add-ons cliquez sur Heroku Postgres::Database
* Télécharger et installer Heroku CLI qui permet de lancer des commandes sur le serveur distant
* Une fois installé lancer les commandes suivantes:
	* heroku login (entrez vos credentials)
	* heroku run --app <app-name> rake db:setup

Pour accéder au site l’url est: https://<app-name>.herokuapp.com/admin
Les credentials par défaut sont admin@example.com / password
