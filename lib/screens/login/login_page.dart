import 'package:flutter/material.dart';
import 'package:split_it/screens/login/widgets/social_button.dart';
import 'package:split_it/theme/app_theme.dart';
import 'login_controller.dart';
import 'login_service.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //late por ser uma variável inicializada posteriormente.
  late LoginController controller;

  //inicialização da variável controller;
  @override
  void initState() {
    controller = LoginController(
        service: LoginServiceImpl(),
        onUpdate: () {
          if (controller.state is LoginStateSuccess) {
            final user = (controller.state as LoginStateSuccess).user;
            Navigator.pushReplacementNamed(context, '/home', arguments: user);
          } else {
            setState(() {});
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
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
                //uso do operador spread
                if (controller.state is LoginStateLoading) ...[
                  CircularProgressIndicator(),
                ] else if (controller.state is LoginStateFailure) ...[
                  Text((controller.state as LoginStateFailure).message)
                ] else
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
