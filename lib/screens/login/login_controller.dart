import 'package:flutter/material.dart';
import 'login_service.dart';
import 'login_state.dart';

class HomeController {
  LoginState state = HomeStateEmpty();
  // void callback que serve para informar a página da atualização
  VoidCallback onUpdate;
  Function(LoginState state)? onChange;

  //injeção de dependência
  final HomeRepository service;

  HomeController({required this.onUpdate, required this.service});

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();
      final user = await service.googleSignIn();
      state = LoginStateSuccess(user: user);
      update();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(state);
    }
  }

  void listen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
