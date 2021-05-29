import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'modules/login/login_page.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool _initialized = false;
  bool _error = false;
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set '_initialized' state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set '_error' state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Material(
        child: Center(
          child: Text('Erro na inicialização do firebase'),
        ),
      );
    }
    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return MaterialApp(
      title: 'Split.it',
      home: LoginPage(),
    );
  }
}
