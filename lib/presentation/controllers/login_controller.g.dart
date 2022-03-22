// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$stateAtom = Atom(name: '_LoginControllerBase.state');

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$userAtom = Atom(name: '_LoginControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$googleSignInAsyncAction =
      AsyncAction('_LoginControllerBase.googleSignIn');

  @override
  Future<void> googleSignIn() {
    return _$googleSignInAsyncAction.run(() => super.googleSignIn());
  }

  @override
  String toString() {
    return '''
state: ${state},
user: ${user}
    ''';
  }
}
