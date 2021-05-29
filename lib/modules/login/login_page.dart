import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:split_it/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      style: GoogleFonts.montserrat(
                        color: AppTheme.colors.title,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 42.0),
                  child: ListTile(
                    leading: Image.asset('assets/images/emoji.png'),
                    title: Text(
                      'Faça seu login com\numa das contas abaixo: ',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.colors.button,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  icon: Image.asset('assets/images/google.png'),
                  label: Text(
                    'Entrar com Google',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.colors.button,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  icon: Image.asset('assets/images/apple.png'),
                  label: Text(
                    'Entrar com Apple',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.colors.button,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
