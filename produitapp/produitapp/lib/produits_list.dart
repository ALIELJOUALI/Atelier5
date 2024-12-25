import 'package:flutter/material.dart';
// Import du package flutter_slidable
import 'package:produitapp/produit_box.dart';
// Import du fichier add_produit.dart
class ProduitsList extends StatefulWidget {
  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List<String> produits = ['Produit 1', 'Produit 2', 'Produit 3'];
  List<bool> selected = [false, false, false];

  void delProduit(int index) {
    setState(() {
      produits.removeAt(index);
      selected.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produits.length,
      itemBuilder: (context, index) {
        return ProduitBox(
          produit: produits[index],
          selProduit: selected[index],
          onChanged: (value) {
            setState(() {
              selected[index] = value ?? false; // Met à jour l'état de sélection
            });
          },
          delProduit: () => delProduit(index), // Fonction de suppression
        );
      },
    );
  }
}
