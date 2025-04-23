# Utiliser une image de base Java
FROM openjdk:11-jdk

ENV AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKE"
ENV AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"

# Créer un répertoire pour le projet
WORKDIR /app

# Copier le fichier secret.sh dans l'image
COPY secret.sh /app/secret.sh

# Donner des permissions d'exécution au script secret.sh
RUN chmod +x /app/secret.sh

# Exécuter le script secret.sh
RUN /app/secret.sh

# Copier le reste du code source (si vous en avez d'autres)
COPY . /app

# Commande pour exécuter votre application (exemple ici
