import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeArea Example',
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Contenuto sicuro all\'interno dell\'area sicura',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
