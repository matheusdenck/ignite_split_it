import 'package:split_it/data/models/dashboard_model.dart';

import '../../../data/models/event_model.dart';

abstract class IHomeRepositoryMock {
  Future<List<EventModel>> getEvents();
  Future<DashboardModel> getDashboard();
}
