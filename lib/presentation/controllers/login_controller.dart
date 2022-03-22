import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../data/login_service.dart';
import '../../data/models/user_model.dart';
import '../../shared/utils/store_state.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  //injeção de dependência
  final LoginRepository service;

  _LoginControllerBase({required this.service});

  @observable
  StoreState state = StoreState.initial;

  @observable
  UserModel user = UserModel(email: '', id: '');

  @action
  Future<void> googleSignIn() async {
    try {
      state = StoreState.loading;
      user = await service.googleSignIn();
      state = StoreState.success;
    } catch (error) {
      state = StoreState.error;
      debugPrint(error.toString());
    }
  }
}
