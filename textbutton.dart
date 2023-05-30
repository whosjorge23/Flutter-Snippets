import 'package:flutter/material.dart';

class MyButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextButton Example'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // Action to perform when the button is pressed
            print('Button Pressed');
          },
          child: Text('Press Me'),
        ),
      ),
    );
  }
}
