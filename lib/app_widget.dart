import 'package:flutter/material.dart';
import 'package:split_it/screens/create_split/create_split_page.dart';
import 'screens/error/error_page.dart';
import 'screens/home/home_page.dart';
import 'screens/login/login_page.dart';
import 'screens/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split.it',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/error': (context) => ErrorPage(),
        '/home': (context) => HomePage(),
        '/create_split': (context) => CreateSplitPage(),
      },
    );
  }
}
