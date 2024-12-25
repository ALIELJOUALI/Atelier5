import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'produit.dart';

class ProduitDetails extends StatelessWidget {
  final Produit produit;

  const ProduitDetails({Key? key, required this.produit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produit.libelle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(produit.photo, width: 100, height: 100),
            SizedBox(height: 16),
            Text('Description: ${produit.description}'),
            SizedBox(height: 8),
            Text('Prix: \$${produit.prix.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
