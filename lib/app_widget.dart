import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:split_it/presentation/pages/create_split_page.dart';

import 'presentation/pages/error_page.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
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
