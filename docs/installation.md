# Installation de Scribberr

## Prérequis

Avant de commencer, assurez-vous d'avoir :

- **Docker** installé sur votre machine
- **Docker Compose** installé
- Au moins **4 GB de RAM** disponible
- **Espace disque** suffisant pour vos fichiers média

## Étapes d'installation

### 1. Vérifier Docker

Vérifiez que Docker est bien installé et fonctionne :

```bash
docker --version
docker-compose --version
```

### 2. Naviguer dans le dossier

```bash
cd scriberr-speach-to-text
```

### 3. Configuration (optionnel)

Éditez le fichier `.env` si vous souhaitez personnaliser :

- Le modèle Whisper (tiny, base, small, medium, large)
- La langue par défaut
- Le port d'accès

**Exemple de configuration :**

```env
WHISPER_MODEL=base    # Recommandé pour débuter
LANGUAGE=fr           # Français
WEB_PORT=3000         # Port de l'interface web
```

### 4. Démarrer Scribberr

Lancez les conteneurs Docker :

```bash
docker-compose up -d
```

La commande `-d` permet de lancer en arrière-plan.

### 5. Vérifier l'installation

Vérifiez que le conteneur fonctionne :

```bash
docker-compose ps
```

Vous devriez voir :

```
NAME        COMMAND    SERVICE      STATUS       PORTS
scribberr   ...        scribberr    Up           0.0.0.0:3000->3000/tcp
```

### 6. Accéder à l'interface

Ouvrez votre navigateur et allez sur :

```
http://localhost:3000
```

## Modèles Whisper

Choisissez selon vos besoins :

| Modèle   | Taille | Vitesse       | Précision |
|----------|--------|---------------|-----------|
| tiny     | 39 MB  | Très rapide   | Basique   |
| base     | 74 MB  | Rapide        | Bonne     |
| small    | 244 MB | Moyen         | Très bonne|
| medium   | 769 MB | Lent          | Excellente|
| large    | 1550 MB| Très lent     | Maximale  |

**Recommandation :** Commencez avec `base`, puis testez d'autres modèles selon vos besoins.

## Mise à jour

Pour mettre à jour Scribberr vers la dernière version :

```bash
docker-compose pull
docker-compose up -d
```

## Désinstallation

Pour arrêter et supprimer les conteneurs :

```bash
docker-compose down
```

Pour supprimer également les volumes (données) :

```bash
docker-compose down -v
```
