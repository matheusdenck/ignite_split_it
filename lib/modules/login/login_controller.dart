import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'login_state.dart';

class LoginController {
  LoginState state = LoginStateEmpty();
  // void callback que serve para informar a página da atualização
  VoidCallback onUpdate;

  LoginController({required this.onUpdate});

  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      state = LoginStateLoading();
      onUpdate();
      final account = await _googleSignIn.signIn();
      state = LoginStateSuccess(
        user: UserModel.google(account!),
      );
      onUpdate();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      onUpdate();
    }
  }
}
