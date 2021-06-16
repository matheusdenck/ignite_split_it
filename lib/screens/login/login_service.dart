import 'package:google_sign_in/google_sign_in.dart';

import 'models/user_model.dart';

abstract class HomeRepository {
  Future<UserModel> googleSignIn();
}

class LoginServiceImpl implements HomeRepository {
  @override
  Future<UserModel> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    final account = await _googleSignIn.signIn();
    return UserModel.google(account!);
  }
}
