import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
  final Function(String) onAddProduit; // Callback to add a product

  AddProduit({required this.onAddProduit});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter un produit'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Nom du produit'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            String produit = _controller.text;
            if (produit.isNotEmpty) {
              onAddProduit(produit); // Call the callback with the new product
              Navigator.of(context).pop(); // Close the dialog
            }
          },
          child: Text('Ajouter'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog without adding
          },
          child: Text('Annuler'),
        ),
      ],
    );
  }
}
