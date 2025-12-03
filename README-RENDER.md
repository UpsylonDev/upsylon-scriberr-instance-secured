# Déploiement Scribberr sur Render.io

Ce guide explique comment déployer Scribberr sur Render.io.

## Prérequis

- Un compte Render.io (gratuit pour commencer)
- Un dépôt Git (GitHub, GitLab, ou Bitbucket) contenant ce code
- La branche `vers-render-0.0.1` poussée sur votre dépôt

## Méthode 1 : Déploiement automatique avec render.yaml

1. **Préparer votre dépôt Git**

   Poussez votre code sur GitHub (ou GitLab/Bitbucket) :
   ```bash
   git add .
   git commit -m "Add Render.io configuration"
   git push origin vers-render-0.0.1
   ```

2. **Créer un nouveau service sur Render**

   - Connectez-vous sur [Render.io](https://render.com)
   - Cliquez sur "New +" puis "Blueprint"
   - Sélectionnez votre dépôt
   - Render détectera automatiquement le fichier `render.yaml`

3. **Modifier les variables d'environnement (optionnel)**

   Dans le dashboard Render, vous pouvez ajuster :
   - `WHISPER_MODEL` : tiny, base, small, medium, large
   - `LANGUAGE` : fr, en, es, etc.
   - `TZ` : Votre fuseau horaire

4. **Déployer**

   Cliquez sur "Apply" pour démarrer le déploiement.

## Méthode 2 : Déploiement manuel

1. **Créer un Web Service**

   - Sur Render.io, cliquez sur "New +" puis "Web Service"
   - Connectez votre dépôt Git
   - Sélectionnez la branche `vers-render-0.0.1`

2. **Configuration**

   - **Name** : `scribberr` (ou votre choix)
   - **Runtime** : Docker
   - **Dockerfile Path** : `./Dockerfile`
   - **Plan** : Choisissez votre plan (Starter pour commencer)

3. **Variables d'environnement**

   Ajoutez ces variables dans la section "Environment" :
   ```
   PUID=1000
   PGID=1000
   TZ=Europe/Paris
   WHISPER_MODEL=base
   LANGUAGE=fr
   WEB_PORT=8080
   ```

4. **Disque persistant**

   - Allez dans l'onglet "Disks"
   - Cliquez sur "Add Disk"
   - **Name** : `scriberr-data`
   - **Mount Path** : `/app/data`
   - **Size** : 10 GB (ajustez selon vos besoins)

5. **Déployer**

   Cliquez sur "Create Web Service"

## Configuration après déploiement

### Accéder à l'application

Votre application sera disponible sur l'URL fournie par Render :
```
https://votre-service-name.onrender.com
```

### Mettre à jour le fichier render.yaml

**IMPORTANT** : Avant le déploiement, modifiez le fichier [render.yaml](render.yaml) :

```yaml
repo: https://github.com/VOTRE_USERNAME/VOTRE_REPO
```

Remplacez par l'URL complète de votre dépôt Git.

## Modèles Whisper et performances

Selon le plan Render que vous choisissez :

| Modèle | Taille | RAM recommandée | Plan Render suggéré |
|--------|--------|-----------------|---------------------|
| tiny   | 39 MB  | 1 GB           | Starter             |
| base   | 74 MB  | 2 GB           | Starter             |
| small  | 244 MB | 4 GB           | Standard            |
| medium | 769 MB | 8 GB           | Pro                 |
| large  | 1550 MB| 16 GB          | Pro+                |

**Recommandation** : Commencez avec le modèle `base` sur un plan Starter.

## Stockage des données

Le disque persistant (`scriberr-data`) conserve :
- Les configurations
- Les modèles téléchargés
- Les fichiers média uploadés
- Les transcriptions générées

**Note** : Le plan gratuit de Render ne supporte pas les disques persistants. Vous devrez passer à un plan payant.

## Coûts estimés

- **Plan Starter** : 7$/mois (512 MB RAM, 0.5 CPU)
- **Plan Standard** : 25$/mois (2 GB RAM, 1 CPU)
- **Disque persistant** : ~0.25$/GB/mois

## Limites et considérations

1. **Plan gratuit** :
   - Pas de disque persistant
   - Le service s'endort après 15 minutes d'inactivité
   - 750 heures/mois maximum

2. **Performance** :
   - La transcription peut être lente sans GPU
   - Préférez les modèles plus petits (tiny, base) pour de meilleures performances

3. **Stockage** :
   - Surveillez l'utilisation de votre disque
   - Nettoyez régulièrement les anciennes transcriptions

## Dépannage

### Le déploiement échoue

- Vérifiez que le Dockerfile est bien à la racine
- Vérifiez les logs dans le dashboard Render
- Assurez-vous que toutes les variables d'environnement sont définies

### L'application ne démarre pas

- Vérifiez que le port 8080 est bien exposé
- Consultez les logs de l'application dans Render

### Transcription très lente

- Passez à un modèle plus petit (tiny ou base)
- Envisagez un plan Render plus puissant
- Render n'offre pas de GPU par défaut

## Mise à jour de l'application

Les mises à jour automatiques se déclenchent à chaque push sur la branche configurée :

```bash
git add .
git commit -m "Update configuration"
git push origin vers-render-0.0.1
```

Render redéploiera automatiquement votre application.

## Support

- [Documentation Render.io](https://render.com/docs)
- [Documentation Scribberr](https://github.com/rishikanthc/scriberr)
- [Discord Render](https://render.com/discord)

## Sécurité

Pour une utilisation en production, considérez :

1. **Authentification** : Ajoutez une couche d'authentification
2. **HTTPS** : Activé par défaut sur Render
3. **Variables sensibles** : Utilisez les variables d'environnement Render (chiffrées)
4. **Backups** : Sauvegardez régulièrement votre disque persistant

## Alternatives à Render

Si Render ne convient pas, considérez :
- **Railway.app** : Interface similaire, pricing compétitif
- **Fly.io** : Plus technique, bon support Docker
- **DigitalOcean App Platform** : Intégration facile
- **AWS/GCP/Azure** : Plus complexe mais plus flexible
