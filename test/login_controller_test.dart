import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';
import 'package:split_it/data/login_service.dart';
import 'package:split_it/data/models/user_model.dart';
import 'package:split_it/presentation/controllers/login_controller.dart';
import 'package:split_it/shared/utils/store_state.dart';

class LoginServiceMock extends Mock implements LoginRepository {}

void main() {
  late LoginController controller;
  late LoginRepository service;

  setUp(() {
    service = LoginServiceMock();
    controller = LoginController(service: service);
  });

  group('LoginController |', () {
    test('Testando se o estado do login está vazio no começo da aplicação', () {
      expect(controller.state, equals(StoreState.initial));
    });

    test('Testando o Google SignIn retornando Success', () async {
      final states = <StoreState>[];
      mobx.autorun((_) {
        states.add(controller.state);
      });
      when(service.googleSignIn)
          .thenAnswer((_) async => UserModel(email: 'email', id: 'id'));
      await controller.googleSignIn();
      expect(states[0], equals(StoreState.initial));
      expect(states[1], equals(StoreState.loading));
      expect(states[2], equals(StoreState.success));
      expect(states.length, equals(3));
    });

    test('Testando o Google SignIn retornando Failure', () async {
      final states = <StoreState>[];
      mobx.autorun((_) {
        states.add(controller.state);
      });
      when(service.googleSignIn).thenThrow('Erro.');
      await controller.googleSignIn();
      expect(states[0], equals(StoreState.initial));
      expect(states[1], equals(StoreState.error));
      expect(states.length, equals(2));
    });

    test('Testando o armazenamento correto do estado', () {
      controller.state = StoreState.loading;
      mobx.autorun((_) => expect(controller.state, equals(StoreState.loading)));
    });
  });
}
