import 'package:flutter/material.dart';
import 'package:split_it/screens/home/repositories/home_repository.dart';
import 'package:split_it/screens/home/repositories/home_repository_mock.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeController {
  final List<EventModel> events = [];
  late HomeRepository repository;

  HomeController() {
    repository = HomeRepositoryMock();
  }

  getEvents(VoidCallback onUpdate) async {
    final response = await repository.getEvents();
    events.addAll(response);
    onUpdate();
  }
}
