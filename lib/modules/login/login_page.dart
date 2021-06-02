import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_it/modules/login/widgets/social_button.dart';
import 'package:split_it/theme/app_theme.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 247,
                    child: Text(
                      'Divida suas contas com seus amigos',
                      style: AppTheme.textStyles.title,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 42.0, right: 32.0),
                  child: ListTile(
                    leading: Image.asset('assets/images/emoji.png'),
                    title: Text(
                      'Faça seu login abaixo: ',
                      style: AppTheme.textStyles.button,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: SocialButtonWidget(
                    imagePath: 'assets/images/google.png',
                    label: 'Entrar com Google',
                    onTap: () {
                      controller.googleSignIn();
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                //TODO: LOGIN APPLE (NÃO TENHO IOS)
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
                //   child: SocialButtonWidget(
                //     imagePath: 'assets/images/apple.png',
                //     label: 'Entrar com Apple',
                //     onTap: () {},
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
