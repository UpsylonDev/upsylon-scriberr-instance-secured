# Utilisation de Scribberr

## Démarrage rapide

### 1. Démarrer Scribberr

Si ce n'est pas déjà fait :

```bash
cd scriberr-speach-to-text
docker-compose up -d
```

### 2. Accéder à l'interface

Ouvrez votre navigateur : **http://localhost:3000**

## Transcrire un fichier audio/vidéo

### Méthode 1 : Via l'interface web

1. Accédez à http://localhost:3000
2. Cliquez sur "Upload" ou "Ajouter un fichier"
3. Sélectionnez votre fichier audio/vidéo
4. Choisissez les options de transcription :
   - Langue (si différente du défaut)
   - Modèle Whisper (si différent du défaut)
5. Cliquez sur "Transcrire"
6. Attendez la fin du traitement
7. Téléchargez la transcription

### Méthode 2 : Via le dossier media

1. Copiez vos fichiers dans le dossier `media/` :

   ```bash
   cp mon-fichier.mp3 scriberr-speach-to-text/media/
   ```

2. Accédez à l'interface web
3. Les fichiers apparaîtront automatiquement
4. Sélectionnez-les pour lancer la transcription

## Formats supportés

Scribberr supporte les formats audio et vidéo courants :

**Audio :**
- MP3
- WAV
- M4A
- FLAC
- OGG

**Vidéo :**
- MP4
- AVI
- MKV
- MOV
- WebM

## Récupérer les transcriptions

Les transcriptions sont disponibles :

1. **Dans l'interface web** : Téléchargez directement après la transcription
2. **Dans le dossier output/** : Les fichiers sont automatiquement sauvegardés

```bash
ls scriberr-speach-to-text/output/
```

Les transcriptions sont généralement au format :
- `.txt` : Texte brut
- `.srt` : Sous-titres avec timestamps
- `.vtt` : Sous-titres WebVTT

## Commandes utiles

### Voir les logs en temps réel

```bash
docker-compose logs -f scribberr
```

### Arrêter Scribberr

```bash
docker-compose stop
```

### Redémarrer Scribberr

```bash
docker-compose restart
```

### Arrêter et supprimer les conteneurs

```bash
docker-compose down
```

## Conseils d'utilisation

### Pour de meilleures transcriptions

1. **Qualité audio** : Utilisez des fichiers avec une bonne qualité sonore
2. **Bruit de fond** : Minimisez le bruit de fond dans vos enregistrements
3. **Langue** : Spécifiez la bonne langue pour de meilleurs résultats
4. **Modèle** : Utilisez un modèle plus grand (medium, large) pour plus de précision

### Optimiser les performances

- **Modèle tiny** : Pour des transcriptions rapides, précision basique
- **Modèle base** : Bon compromis vitesse/précision (recommandé)
- **Modèle small/medium** : Pour plus de précision, si vous avez le temps
- **Modèle large** : Maximum de précision, très lent

### Traiter plusieurs fichiers

1. Copiez tous vos fichiers dans `media/`
2. Dans l'interface, sélectionnez plusieurs fichiers
3. Lancez la transcription en lot
4. Les fichiers seront traités les uns après les autres

## Exemples d'utilisation

### Transcrire un podcast

```bash
# Copier le fichier
cp mon-podcast.mp3 scriberr-speach-to-text/media/

# Lancer Scribberr
docker-compose up -d

# Accéder à http://localhost:3000 et transcrire

# Récupérer la transcription
cat scriberr-speach-to-text/output/mon-podcast.txt
```

### Extraire des sous-titres d'une vidéo

1. Placez votre vidéo dans `media/`
2. Transcrivez via l'interface
3. Téléchargez le fichier `.srt` ou `.vtt`
4. Utilisez-le avec votre lecteur vidéo

## Dépannage

### La transcription est lente

- Utilisez un modèle plus petit (tiny ou base)
- Vérifiez que Docker a suffisamment de ressources

### Erreur de mémoire

- Réduisez la taille du modèle Whisper
- Augmentez la RAM allouée à Docker

### Le fichier n'apparaît pas

- Vérifiez que le fichier est dans le dossier `media/`
- Rafraîchissez la page web
- Vérifiez les logs : `docker-compose logs -f`

### Mauvaise qualité de transcription

- Essayez un modèle plus grand (medium ou large)
- Vérifiez que la langue est correctement configurée
- Améliorez la qualité audio source
