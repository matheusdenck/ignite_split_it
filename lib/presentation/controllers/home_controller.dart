import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/event_model.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/repositories/home_repository_mock.dart';
import '../../shared/utils/store_state.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late HomeRepository repository;

  @observable
  StoreState state = StoreState.initial;

  @observable
  List<EventModel> events = [];

  _HomeControllerBase({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
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
