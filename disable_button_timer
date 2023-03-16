import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disabled Button Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPreferences? _prefs;
  int _buttonCount = 0;
  bool _buttonDisabled = false;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _buttonCount = _prefs!.getInt('buttonCount') ?? 0;
    int lastPressedTime = _prefs!.getInt('lastPressedTime') ?? 0;
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (_buttonCount >= 5 && currentTime - lastPressedTime < 300000) {
      setState(() {
        _buttonDisabled = true;
      });
    }
  }

  Future<void> _handleButtonPress() async {
    if (_buttonDisabled) {
      return;
    }
    setState(() {
      _buttonCount++;
    });
    if (_buttonCount >= 5) {
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      await _prefs!.setInt('lastPressedTime', currentTime);
      setState(() {
        _buttonDisabled = true;
      });
      Future.delayed(Duration(minutes: 5), () {
        setState(() {
          _buttonCount = 0;
          _buttonDisabled = false;
        });
      });
    } else {
      await _prefs!.setInt('buttonCount', _buttonCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disabled Button Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handleButtonPress,
          child: Text(_buttonDisabled
              ? 'Button Disabled'
              : 'Button Pressed $_buttonCount times'),
        ),
      ),
    );
  }
}
