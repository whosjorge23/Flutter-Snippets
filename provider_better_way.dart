import 'package:flutter/foundation.dart';

class MyAppState extends ChangeNotifier {
  String _message = 'Hello, Provider!';

  String get message => _message;

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}

//////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MyApp(),
    ),
  );
}

//////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Example'),
        ),
        body: Center(
          child: Consumer<MyAppState>(
            builder: (context, appState, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appState.message),
                  ElevatedButton(
                    onPressed: () {
                      appState.updateMessage('Provider is awesome!');
                    },
                    child: Text('Update Message'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
