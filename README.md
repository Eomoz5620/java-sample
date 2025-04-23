# Java Sample Project

Ce projet est un exemple simple d'application Java avec des dépendances vulnérables et une fuite de secret. Il est utilisé pour démontrer comment Trivy peut être utilisé pour scanner les vulnérabilités dans les dépendances et détecter des secrets exposés dans le code.

## Prérequis

Avant de commencer, assurez-vous que vous avez les outils suivants installés sur votre machine :

- [Java JDK 11+](https://adoptopenjdk.net/)
- [Maven](https://maven.apache.org/)
- [Trivy](https://github.com/aquasecurity/trivy)

## Installation

1. Clonez ce dépôt :

   ```bash
   git clone https://github.com/Eomoz5620/java-sample.git
   cd java-sample
   ```

2. Construisez le projet avec Maven :

   ```bash
   mvn clean package
   ```

3. Ce projet utilise des dépendances vulnérables comme `log4j-core` (CVE-2021-44228) et `jackson-databind` (CVE-2019-12384).

## Scanner les vulnérabilités avec Trivy

Une fois le projet construit, vous pouvez utiliser Trivy pour scanner les dépendances Java et rechercher des vulnérabilités.

### Commande pour scanner les vulnérabilités

```bash
trivy fs . --scanners vuln --pkg-types library
```

Cette commande va scanner les bibliothèques Java spécifiées dans le `pom.xml` et afficher les vulnérabilités détectées.

### Résultat attendu

Trivy devrait afficher un rapport de vulnérabilité pour des CVE connues comme :

```
2025-04-23T13:57:28+02:00  INFO    Vulnerability scanning is enabled
2025-04-23T13:57:28+02:00  INFO    Number of vulnerabilities found: 2
2025-04-23T13:57:28+02:00  INFO    Vulnerability details:
- Log4j-core (2.14.1) - CVE-2021-44228 (Critical)
- Jackson-databind (2.9.9) - CVE-2019-12384 (High)
```

## Scanner les secrets avec Trivy

Trivy peut également être utilisé pour détecter des secrets exposés dans le code source.

### Commande pour scanner les secrets

```bash
trivy secret . --format table
```

Cela va scanner le code source à la recherche de secrets exposés, comme des clés API, mots de passe, etc.

### Exemple de résultat

Si un secret est trouvé dans le code, Trivy renverra un message comme celui-ci :

```
SECRET FOUND: apiKey in src/main/java/com/example/App.java: line 8
```

## Structure du projet

Voici la structure du projet :

```
java-sample/
├── pom.xml                # Fichier de configuration Maven
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── example/
│                   └── App.java  # Le code source contenant une fuite de secret
├── target/                # Répertoire de build généré par Maven (à ignorer)
└── .gitignore             # Fichiers à ignorer dans Git
```

## Contribution

Si vous avez des suggestions ou des améliorations pour ce projet, n'hésitez pas à ouvrir une **issue** ou à soumettre une **pull request**.

## Licence

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.
