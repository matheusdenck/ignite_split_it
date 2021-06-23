import 'package:flutter/material.dart';
import 'package:split_it/screens/home/repositories/home_repository.dart';
import 'package:split_it/screens/home/repositories/home_repository_mock.dart';
import 'package:split_it/screens/home/widgets/app_bar/app_bar_state.dart';

class AppBarController {
  late HomeRepository repository;

  Function(AppBarState state)? onListen;

  AppBarState state = AppBarStateEmpty();

  AppBarController({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  getDashboard(VoidCallback onUpdate) async {
    state = AppBarStateLoading();
    update();
    try {
      final response = await repository.getDashboard();
      state = AppBarStateSuccess(dashboard: response);
      update();
    } catch (e) {
      state = AppBarStateFailure(message: e.toString());
      update();
    }
    onUpdate();
  }

  void update() {
    if (onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(AppBarState state) onChange) {
    onListen = onChange;
  }
}
