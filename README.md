# Installation Scribberr avec Docker

Scribberr est une solution auto-hébergée pour la transcription audio/vidéo utilisant Whisper AI.

## Prérequis

- Docker et Docker Compose installés
- Au moins 4 GB de RAM disponible
- Espace disque suffisant pour les médias et transcriptions

## Structure des dossiers

```
scriberr-speach-to-text/
├── docker-compose.yml    # Configuration Docker
├── .env                  # Variables d'environnement
├── config/              # Configuration de l'application
├── media/               # Fichiers audio/vidéo à transcrire
└── output/              # Transcriptions générées
```

## Installation

1. **Démarrer les conteneurs**

   ```bash
   docker-compose up -d
   ```

2. **Vérifier que le conteneur fonctionne**

   ```bash
   docker-compose ps
   docker-compose logs -f
   ```

3. **Accéder à l'interface web**

   Ouvrez votre navigateur et allez sur : http://localhost:3001

## Configuration

### Modèles Whisper disponibles

Modifiez la variable `WHISPER_MODEL` dans le fichier `.env` :

- `tiny` : Le plus rapide, moins précis (39 MB)
- `base` : Bon équilibre (74 MB) - **Recommandé pour débuter**
- `small` : Plus précis (244 MB)
- `medium` : Très précis (769 MB)
- `large` : Le plus précis (1550 MB)

### Langues supportées

Modifiez la variable `LANGUAGE` dans le fichier `.env` :
- `fr` : Français
- `en` : Anglais
- `es` : Espagnol
- etc.

## Utilisation

1. Placez vos fichiers audio/vidéo dans le dossier `media/`
2. Accédez à l'interface web sur http://localhost:3001
3. Sélectionnez les fichiers à transcrire
4. Les transcriptions seront disponibles dans le dossier `output/`

## Commandes utiles

### Arrêter les conteneurs
```bash
docker-compose down
```

### Redémarrer les conteneurs
```bash
docker-compose restart
```

### Voir les logs
```bash
docker-compose logs -f scribberr
```

### Mettre à jour l'image
```bash
docker-compose pull
docker-compose up -d
```

### Nettoyer les données
```bash
docker-compose down -v
```

## Dépannage

### Le conteneur ne démarre pas
- Vérifiez que le port 3001 n'est pas déjà utilisé (configurable dans le fichier `.env`)
- Consultez les logs : `docker-compose logs`

### Transcription lente
- Utilisez un modèle plus petit (tiny ou base)
- Vérifiez que Docker a accès au GPU si disponible

### Problèmes de permissions
Sur Linux, ajustez les valeurs PUID et PGID dans `.env` :
```bash
id -u  # Pour obtenir PUID
id -g  # Pour obtenir PGID
```

## Support

Pour plus d'informations, consultez la documentation officielle de Scribberr.
