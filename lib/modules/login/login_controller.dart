import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  Future<void> googleSignIn() async {
    var user;
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      user = await _googleSignIn.signIn();
      print(user);
      print('Nome: ${user.displayName}');
    } catch (error) {
      print(error);
    }
  }
}
