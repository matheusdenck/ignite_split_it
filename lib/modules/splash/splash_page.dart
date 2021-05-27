import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.gradients.background,
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/retangulo-dir.png',
              width: 198,
              height: 98,
            ),
            Image.asset(
              'assets/images/retangulo-dir.png',
              width: 114,
              height: 58,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 128,
              height: 112,
            ),
            Image.asset(
              'assets/images/retangulo-esq.png',
              width: 114,
              height: 58,
            ),
            Image.asset(
              'assets/images/retangulo-esq.png',
              width: 198,
              height: 98,
            )
          ],
        ),
      ),
    );
  }
}
