import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/screens/home/home_controller.dart';
import 'package:split_it/screens/home/repositories/home_repository.dart';
import 'package:split_it/screens/login/login_state.dart';
import 'package:split_it/screens/login/models/user_model.dart';

//classe mockada
class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeController controller;
  late HomeRepository repository;

  setUp(() {
    repository = HomeRepositoryMock();
    controller = HomeController(repository: repository);
  });

  test('Testando se o estado do login está vazio no começo da aplicação', () {
    expect(controller.state, isInstanceOf<HomeStateEmpty>());
  });

  test('Testando o Google SignIn retornando Success', () async {
    final states = <LoginState>[];
    controller.listen((state) => states.add(state));
    when(repository.googleSignIn)
        .thenAnswer((_) async => UserModel(email: 'email', id: 'id'));
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 2);
  });

  test('Testando o Google SignIn retornando Failure', () async {
    final states = <LoginState>[];
    controller.listen((state) => states.add(state));
    when(repository.googleSignIn).thenThrow('Erro.');
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect((states[1] as LoginStateFailure).message, 'Erro.');
    expect(states.length, 2);
  });

  test('Testando o método listen', () {
    controller.state = LoginStateLoading();
    controller
        .listen((state) => expect(state, isInstanceOf<LoginStateLoading>()));
    controller.update();
  });
}
