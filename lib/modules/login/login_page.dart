import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Text(
                'Divida\nsuas contas\ncom seus\namigos',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 42.0),
              child: Row(
                children: [
                  Image.asset('assets/images/emoji.png'),
                  SizedBox(width: 24),
                  Text(
                    'Faça seu login com\numa das contas abaixo: ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Card(),
          ],
        ),
      ),
    );
  }
}
