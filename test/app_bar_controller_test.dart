import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/data/models/dashboard_model.dart';
import 'package:split_it/domain/repositories/home_repository.dart';
import 'package:split_it/presentation/controllers/app_bar_controller.dart';
import 'package:split_it/shared/utils/store_state.dart';

//classe mockada
class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  final repository = HomeRepositoryMock();

  late AppBarController controller;

  setUp(() {
    controller = AppBarController(repository: repository);
  });

  group('AppBarController |', () {
    test('Testando o GetDashboard retornando Success', () async {
      final states = <StoreState>[];
      mobx.autorun((_) => states.add(controller.state));
      when(repository.getDashboard)
          .thenAnswer((_) async => DashboardModel(send: 100, receive: 50));
      await controller.getDashboard();
      expect(states[0], equals(StoreState.initial));
      expect(states[1], equals(StoreState.loading));
      expect(states[2], equals(StoreState.success));
      expect(states.length, equals(3));
    });

    test('Testando o GetDashboard retornando Failure', () async {
      final states = <StoreState>[];
      mobx.autorun((_) => states.add(controller.state));
      when(repository.getDashboard).thenThrow('Erro.');
      await controller.getDashboard();
      expect(states[0], equals(StoreState.initial));
      expect(states[1], equals(StoreState.error));
      expect(states.length, equals(2));
    });
  });
}
