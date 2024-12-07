// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shop api'),
      ),
      body: Center(
        child: Text('Ecommerce api with bloc-cubit'),
      ),
    );
  }
}
