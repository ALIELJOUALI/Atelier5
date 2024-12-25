import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
  final String produit;
  final bool selProduit;
  final ValueChanged<bool?> onChanged;
  final Function delProduit;

  const ProduitBox({
    Key? key,
    required this.produit,
    required this.selProduit,
    required this.onChanged,
    required this.delProduit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Utilisation de Slidable pour le geste de glissement
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                value: selProduit,
                onChanged: onChanged,
              ),
              Expanded(
                child: Text(
                  produit,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => delProduit(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Supprimer',
          ),
        ],
      ),
    );
  }
}
