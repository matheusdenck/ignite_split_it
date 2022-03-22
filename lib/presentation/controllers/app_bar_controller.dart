import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/data/models/dashboard_model.dart';

import '../../domain/repositories/home_repository.dart';
import '../../domain/repositories/home_repository_mock.dart';
import '../../shared/utils/store_state.dart';

part 'app_bar_controller.g.dart';

class AppBarController = _AppBarControllerBase with _$AppBarController;

abstract class _AppBarControllerBase with Store {
  late HomeRepository repository;

  @observable
  StoreState state = StoreState.initial;

  @observable
  DashboardModel dashboard = DashboardModel(send: 0, receive: 0);

  _AppBarControllerBase({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  @action
  Future<void> getDashboard() async {
    state = StoreState.loading;
    try {
      final response = await repository.getDashboard();
      dashboard = response;
      state = StoreState.success;
    } catch (e) {
      state = StoreState.error;
      debugPrint(e.toString());
    }
  }
}
