import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/screens/home/home_state.dart';
import 'package:split_it/screens/home/repositories/home_repository.dart';
import 'package:split_it/screens/home/repositories/home_repository_mock.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late HomeRepository repository;

  @observable
  HomeState state = HomeStateEmpty();

  _HomeControllerBase({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  //void callback necessário para passar as infos para atualizar o set state na home page
  @action
  getEvents() async {
    state = HomeStateLoading();
    try {
      final response = await repository.getEvents();
      state = HomeStateSuccess(events: response);
    } catch (e) {
      state = HomeStateFailure(message: e.toString());
    }
  }
}
