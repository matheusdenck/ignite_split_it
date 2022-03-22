import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/data/models/event_model.dart';
import 'package:split_it/domain/repositories/home_repository.dart';
import 'package:split_it/presentation/controllers/home_controller.dart';
import 'package:split_it/shared/utils/store_state.dart';

//classe mockada
class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeController controller;
  final repository = HomeRepositoryMock();

  setUp(() {
    controller = HomeController(repository: repository);
  });

  group('HomeController |', () {
    test('Testando o getEvents retornando Success', () async {
      final states = <StoreState>[];
      mobx.autorun((_) => states.add(controller.state));
      when(repository.getEvents).thenAnswer((_) async => [
            EventModel(
              title: 'title',
              created: DateTime.now(),
              value: 100,
              people: 1,
            )
          ]);
      await controller.getEvents();
      expect(states[0], equals(StoreState.initial));
      expect(states[1], equals(StoreState.loading));
      expect(states[2], equals(StoreState.success));
      expect(states.length, equals(3));
    });

    test('Testando o getEvents retornando Failure', () async {
      final states = <StoreState>[];
      mobx.autorun((_) => states.add(controller.state));
      when(repository.getEvents).thenThrow('Erro.');
      await controller.getEvents();
      expect(states[0], equals(StoreState.initial));
      expect(states[1], equals(StoreState.error));
      expect(states.length, equals(2));
    });
  });
}
