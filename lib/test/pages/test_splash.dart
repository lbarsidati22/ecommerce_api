// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_api/test/pages/test_home.dart';
import 'package:ecommerce_api/test/test_layout/test_home_layout.dart';
import 'package:flutter/material.dart';

class TestSplash extends StatefulWidget {
  const TestSplash({super.key});

  @override
  State<TestSplash> createState() => _TestSplashState();
}

class _TestSplashState extends State<TestSplash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TestHomeLayout(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image(
                  height: 160,
                  width: 150,
                  image: AssetImage('images/splash.png'),
                ),
              ),
            ),
            Text(
              'Developed By lbar sidati',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
