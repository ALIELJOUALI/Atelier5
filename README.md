# Produits App

Une application Flutter pour la gestion des produits permettant d'ajouter, afficher, sélectionner et supprimer des produits.

## Fonctionnalités

- Affichage de la liste des produits
- Ajout d'un nouveau produit via une boîte de dialogue
- Sélection multiple de produits avec des cases à cocher
- Suppression d'un produit individuel par glissement (slidable)
- Suppression en masse des produits sélectionnés

## Prérequis

- Flutter SDK
- Dart SDK
- Un éditeur de code (VS Code, Android Studio, etc.)

## Installation

1. Clonez le repository :
```bash
git clone [URL_DU_REPO]
cd produitsapp
```

2. Installez les dépendances :
```bash
flutter pub get
```

## Structure du Projet

```
produitsapp/
├── lib/
│   ├── main.dart
│   ├── produits_list.dart
│   ├── produit_box.dart
│   └── add_produit.dart
├── pubspec.yaml
└── README.md
```

## Dépendances

Le projet utilise les packages suivants :
- `flutter_slidable`: Pour la fonctionnalité de suppression par glissement

## Configuration

Assurez-vous que votre fichier `pubspec.yaml` contient les dépendances nécessaires :

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_slidable: ^[version]
```

## Utilisation

1. Lancer l'application :
```bash
flutter run
```

2. Pour ajouter un produit :
   - Appuyez sur le bouton "Ajout d'un produit"
   - Remplissez le nom du produit dans la boîte de dialogue
   - Validez l'ajout

3. Pour supprimer un produit :
   - Faites glisser le produit vers la gauche
   - Appuyez sur l'icône de suppression

4. Pour sélectionner des produits :
   - Cochez les cases à côté des produits désirés
   - Utilisez le bouton de suppression multiple pour supprimer la sélection

## Contribution

1. Fork le projet
2. Créez votre branche de fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## Licence

Ce projet est sous licence MIT - voir le fichier LICENSE pour plus de détails.
