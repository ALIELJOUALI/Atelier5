import 'package:flutter/material.dart';
import 'produits_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produits App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProduitsApp(),
    );
  }
}
