import 'package:split_it/data/models/dashboard_model.dart';

import '../../../data/models/event_model.dart';
import 'firebase_repository.dart';
import 'home_repository_mock.dart';

class HomeRepositoryFirebase implements IHomeRepositoryMock {
  final client = FirebaseRepository();

  @override
  Future<DashboardModel> getDashboard() async {
    await Future.delayed(Duration(seconds: 2));
    return DashboardModel(send: 100, receive: 50);
  }

  @override
  Future<List<EventModel>> getEvents() async {
    try {
      final response = await client.get(collection: '/events');
      final eventsList = response.map((e) => EventModel.fromMap(e)).toList();
      return eventsList;
    } catch (e) {
      throw e;
    }
  }
}
