import 'package:flutter/material.dart';
import 'produit_box.dart';

class ProduitsApp extends StatefulWidget {
  @override
  _ProduitsAppState createState() => _ProduitsAppState();
}

class _ProduitsAppState extends State<ProduitsApp> {
  List<String> produits = ['Produit 1', 'Produit 2', 'Produit 3'];
  List<bool> selected = [false, false, false];

  void delProduit(int index) {
    setState(() {
      produits.removeAt(index);
      selected.removeAt(index);
    });
  }

  void addProduit(String produit) {
    setState(() {
      produits.add(produit);
      selected.add(false); // Ajout d'une case à cocher pour le nouveau produit
    });
  }

  void delSelectedProduits() {
    setState(() {
      // Supprime les produits sélectionnés
      for (int i = produits.length - 1; i >= 0; i--) {
        if (selected[i]) {
          produits.removeAt(i);
          selected.removeAt(i);
        }
      }
    });
  }

  void showAddProduitDialog() {
    String newProduit = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter un Produit'),
          content: TextField(
            onChanged: (value) {
              newProduit = value;
            },
            decoration: InputDecoration(hintText: 'Nom du produit'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newProduit.isNotEmpty) {
                  addProduit(newProduit);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Ajouter'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion des Produits'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: delSelectedProduits, // Supprimer les produits sélectionnés
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            produit: produits[index],
            selProduit: selected[index],
            onChanged: (value) {
              setState(() {
                selected[index] = value ?? false;
              });
            },
            delProduit: () => delProduit(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddProduitDialog, // Ouvrir le dialogue d'ajout
        child: Icon(Icons.add),
      ),
    );
  }
}
