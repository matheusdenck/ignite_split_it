import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/screens/home/home_controller.dart';
import 'package:split_it/screens/home/home_state.dart';
import 'package:split_it/screens/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

//classe mockada
class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeController controller;
  late HomeRepository repository;

  setUp(() {
    repository = HomeRepositoryMock();
    controller = HomeController(repository: repository);
  });

  test('Testando o GetEvents retornando Success', () async {
    expect(controller.state, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
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
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateLoading>());
    expect(states[2], isInstanceOf<HomeStateSuccess>());
    expect(states.length, equals(3));
  });

  test('Testando o getEvents retornando Failure', () async {
    final states = <HomeState>[];
    mobx.autorun((_) => states.add(controller.state));
    when(repository.getEvents).thenThrow('Erro.');
    await controller.getEvents();
    expect(states[0], isInstanceOf<HomeStateEmpty>());
    expect(states[1], isInstanceOf<HomeStateFailure>());
    expect((states[1] as HomeStateFailure).message, 'Erro.');
    expect(states.length, equals(2));
  });
}
