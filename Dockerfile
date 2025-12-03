# Utilisation de l'image officielle Scribberr
FROM ghcr.io/rishikanthc/scriberr:latest

# Expose le port par défaut de Scribberr
EXPOSE 8080

# Les variables d'environnement seront fournies par Render
# Le volume de données sera monté par Render sur /app/data