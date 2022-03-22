import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/presentation/widgets/social_button.dart';
import 'package:split_it/theme/app_theme.dart';

import '../../data/login_service.dart';
import '../../shared/utils/store_state.dart';
import '../controllers/login_controller.dart';

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
    );
    autorun(
      (_) {
        if (controller.state == StoreState.success) {
          Navigator.pushReplacementNamed(context, '/home',
              arguments: controller.user);
        }
      },
    );
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
                Observer(
                  builder: (context) {
                    if (controller.state == StoreState.loading)
                      return CircularProgressIndicator();
                    else if (controller.state == StoreState.error)
                      return Text('Erro na requisição');
                    else
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: SocialButtonWidget(
                          imagePath: 'assets/images/google.png',
                          label: 'Entrar com Google',
                          onTap: () {
                            controller.googleSignIn();
                          },
                        ),
                      );
                  },
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
