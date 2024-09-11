
# Setup Perso Automatisé

Ce projet contient un script pour automatiser la configuration complète d'un environnement de développement avec plusieurs outils, frameworks et technologies, comme **Docker Hub**, **GitLab**, **Gradle**, **Python/Django**, et **Jupyter Notebook**.

## Instructions d'Installation

1. Clonez ce dépôt ou téléchargez le fichier `setup.sh`.
   
2. Donnez les permissions d'exécution au script :
   ```bash
   chmod +x setup.sh
   ```

3. Exécutez le script :
   ```bash
   ./setup.sh
   ```

## Contenu du Script

Le script inclut les sections suivantes pour une configuration complète :

### 1. Pré-requis WSL (si vous êtes sous Windows)

Le script détecte automatiquement si vous êtes sous Windows et active **WSL** (Windows Subsystem for Linux) ainsi que la virtualisation nécessaire.

### 2. Installation de Base (Zsh et Oh My Zsh)

Le script installe et configure **Zsh** avec **Oh My Zsh**, incluant des plugins tels que **Autosuggestions** et **Syntax Highlighting** pour améliorer l'expérience en ligne de commande.

### 3. Java & Spring/Angular Setup

- Utilise **SDKMAN** pour installer et gérer plusieurs versions de **Java** (8, 17, 21).
- Installe **Maven** et **Gradle** pour la gestion de projets Java.

### 4. Python (Django & Flask)

- Installe **Python 3**, **Django**, **Flask**, ainsi que le **Django REST Framework** et les bibliothèques pour PostgreSQL.
- Installe **Jupyter Notebook** pour travailler sur des notebooks Python.

### 5. Node.js & Frontend

- Utilise **NVM** pour gérer plusieurs versions de **Node.js**.
- Installe **Yarn** et **Angular CLI** pour le développement frontend.

### 6. Ruby & Rails

- Installe **rbenv** pour la gestion des versions de **Ruby**, ainsi que **Rails**.

### 7. Bases de Données

- Installe et configure **MySQL**, **PostgreSQL**, et **MongoDB**.

### 8. Serveurs (Nginx, Apache, Tomcat)

- Installe et démarre les serveurs **Nginx**, **Apache**, et **Tomcat** pour les applications JEE.

### 9. Docker, Podman, Docker Hub & GitLab

- Installe et configure **Docker** et **Podman**.
- Connexion à **Docker Hub** via `docker login`.
- Génère une clé **SSH** pour **GitLab** et configure **Git**.

### 10. GitHub CLI

- Installe et configure **GitHub CLI** pour interagir facilement avec GitHub.

### 11. Visual Studio Code & Extensions

Le script installe **Visual Studio Code** ainsi que les extensions nécessaires pour Java, Python, Spring, et ESLint.

## Notes Supplémentaires

- Le script inclut la génération et l'ajout automatique de clés SSH pour GitLab.
- Il est possible de personnaliser les variables pour adapter le script à vos propres besoins.

## Vérification

À la fin de l'exécution du script, vérifiez que tout est installé correctement avec les commandes suivantes :
   ```bash
   java -version
   python3 --version
   node -v
   ruby -v
   rails -v
   docker --version
   ```

## TODO

- Remplacer les variables par les vrais credentials dans certaines parties du script, comme la commande `docker login`.
