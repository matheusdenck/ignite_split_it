// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_rounded_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckRoundedController on _CheckRoundedControllerBase, Store {
  final _$stateAtom = Atom(name: '_CheckRoundedControllerBase.state');

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

  final _$updateAsyncAction = AsyncAction('_CheckRoundedControllerBase.update');

  @override
  Future<void> update(FriendModel friend) {
    return _$updateAsyncAction.run(() => super.update(friend));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
