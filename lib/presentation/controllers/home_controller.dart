import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/event_model.dart';
import '../../domain/repositories/home_repository_mock.dart';
import '../../domain/repositories/home_repository_mock_impl.dart';
import '../../shared/utils/store_state.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late IHomeRepositoryMock repository;

  @observable
  StoreState state = StoreState.initial;

  @observable
  List<EventModel> events = [];

  _HomeControllerBase({IHomeRepositoryMock? repository}) {
    this.repository = repository ?? HomeRepositoryMockImpl();
  }
  @action
  Future<void> getEvents() async {
    state = StoreState.loading;
    try {
      final response = await repository.getEvents();
      events = response;
      state = StoreState.success;
    } catch (e) {
      state = StoreState.error;
      debugPrint(e.toString());
    }
  }
}
