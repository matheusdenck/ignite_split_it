import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/screens/login/login_controller.dart';
import 'package:split_it/screens/login/login_service.dart';
import 'package:split_it/screens/login/login_state.dart';
import 'package:split_it/screens/login/models/user_model.dart';

//classe mockada
class LoginServiceMock extends Mock implements LoginRepository {}

void main() {
  late LoginController controller;
  late LoginRepository service;

  setUp(() {
    service = LoginServiceMock();
    controller = LoginController(service: service);
  });

  test('Testando se o estado do login está vazio no começo da aplicação', () {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());
  });

  test('Testando o Google SignIn retornando Success', () async {
    final states = <LoginState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(service.googleSignIn)
        .thenAnswer((_) async => UserModel(email: 'email', id: 'id'));
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateEmpty>());
    expect(states[1], isInstanceOf<LoginStateLoading>());
    expect(states[2], isInstanceOf<LoginStateSuccess>());
    expect(states.length, equals(3));
  });

  test('Testando o Google SignIn retornando Failure', () async {
    final states = <LoginState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(service.googleSignIn).thenThrow('Erro.');
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateEmpty>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect((states[1] as LoginStateFailure).message, 'Erro.');
    expect(states.length, equals(2));
  });

  test('Testando o armazenamento correto do estado', () {
    controller.state = LoginStateLoading();
    mobx.autorun(
        (_) => expect(controller.state, isInstanceOf<LoginStateLoading>()));
  });
}
