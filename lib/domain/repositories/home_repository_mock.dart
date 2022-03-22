import 'package:split_it/data/models/dashboard_model.dart';

import '../../../data/models/event_model.dart';
import 'home_repository.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<DashboardModel> getDashboard() async {
    await Future.delayed(Duration(seconds: 2));
    return DashboardModel(send: 100, receive: 50);
  }

  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      EventModel(
          created: DateTime.now(), title: 'Churrasco', value: 50, people: 3),
      EventModel(
          created: DateTime.now(), title: 'Churrasco', value: -450, people: 13),
      EventModel(
          created: DateTime.now(), title: 'Churrasco', value: 50, people: 3),
      EventModel(
          created: DateTime.now(), title: 'Churrasco', value: -50, people: 3),
      EventModel(
          created: DateTime.now(), title: 'Churrasco', value: 50, people: 3),
      EventModel(
          created: DateTime.now(), title: 'Churrasco', value: -43, people: 3),
      EventModel(
          created: DateTime.now(), title: 'Churrasco', value: 50, people: 3),
    ];
  }
}
