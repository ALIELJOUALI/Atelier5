import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'produit.dart';
import 'produitDetails.dart';
import 'package:flutter/material.dart';

class ProduitsApp extends StatefulWidget {
  @override
  _ProduitsAppState createState() => _ProduitsAppState();
}

class _ProduitsAppState extends State<ProduitsApp> {
  List<Produit> produits = [
    Produit(
        libelle: 'Produit 1',
        description: 'Description 1',
        prix: 10.0,
        photo: 'assets/photo1.png'),
    Produit(
        libelle: 'Produit 2',
        description: 'Description 2',
        prix: 20.0,
        photo: 'assets/photo2.png'),
    Produit(
        libelle: 'Produit 3',
        description: 'Description 3',
        prix: 30.0,
        photo: 'assets/photo3.png'),
  ];
  List<bool> selected = [false, false, false];

  void addProduit(Produit produit) {
    setState(() {
      produits.add(produit);
      selected.add(false);
    });
  }

  void delProduit(int index) {
    setState(() {
      produits.removeAt(index);
      selected.removeAt(index);
    });
  }

  void delSelectedProduits() {
    setState(() {
      for (int i = produits.length - 1; i >= 0; i--) {
        if (selected[i]) {
          produits.removeAt(i);
          selected.removeAt(i);
        }
      }
    });
  }

  void showAddProduitDialog() {
    String libelle = '';
    String description = '';
    double prix = 0.0;
    String photo = 'assets/default.png';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter un Produit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nom du produit'),
                onChanged: (value) => libelle = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) => description = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Prix'),
                keyboardType: TextInputType.number,
                onChanged: (value) => prix = double.tryParse(value) ?? 0.0,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (libelle.isNotEmpty) {
                  addProduit(Produit(
                      libelle: libelle,
                      description: description,
                      prix: prix,
                      photo: photo));
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

  void showProduitDetails(Produit produit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProduitDetails(produit: produit),
      ),
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
            onPressed: delSelectedProduits,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => showProduitDetails(produits[index]),
            child: ProduitBox(
              produit: produits[index],
              selProduit: selected[index],
              onChanged: (value) {
                setState(() {
                  selected[index] = value ?? false;
                });
              },
              delProduit: () => delProduit(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddProduitDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
