import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/screens/home/home_state.dart';
import 'package:split_it/screens/home/models/dashboard_model.dart';
import 'package:split_it/screens/home/repositories/home_repository.dart';
import 'package:split_it/screens/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/screens/home/widgets/app_bar/app_bar_state.dart';

//classe mockada
class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late AppBarController controller;
  late HomeRepository repository;

  setUp(() {
    repository = HomeRepositoryMock();
    controller = AppBarController(repository: repository);
  });

  test('Testando o GetDashboard retornando Success', () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    controller.listen((state) => states.add(state));
    when(repository.getDashboard)
        .thenAnswer((_) async => DashboardModel(send: 100, receive: 50));
    await controller.getDashboard(() {});
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateSuccess>());
    expect(states.length, 2);
  });

  test('Testando o GetDashboard retornando Failure', () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    controller.listen((state) => states.add(state));
    when(repository.getDashboard).thenThrow('Erro.');
    await controller.getDashboard(() {});
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateFailure>());
    expect((states[1] as AppBarStateFailure).message, 'Erro.');
    expect(states.length, 2);
  });
}
