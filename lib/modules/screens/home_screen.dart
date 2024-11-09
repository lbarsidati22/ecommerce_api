import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce app'),
      ),
      body: Center(
        child: Text('Ecommerec app with api and bloc-cubit'),
      ),
    );
  }
}
