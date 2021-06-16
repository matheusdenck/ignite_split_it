import 'package:flutter/material.dart';
import 'package:split_it/screens/home/home_state.dart';
import 'package:split_it/screens/home/repositories/home_repository.dart';
import 'package:split_it/screens/home/repositories/home_repository_mock.dart';

class HomeController {
  late HomeRepository repository;
  HomeState state = HomeStateEmpty();

  HomeController({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  //void callback necessário para passar as infos para atualizar o set state na home page
  getEvents(VoidCallback onUpdate) async {
    state = HomeStateLoading();
    final response = await repository.getEvents();
    state = HomeStateSuccess(events: response);
    onUpdate();
  }
}
