// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_two_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StepTwoController on _StepTwoControllerBase, Store {
  final _$friendsAtom = Atom(name: '_StepTwoControllerBase.friends');

  @override
  List<Map<String, dynamic>> get friends {
    _$friendsAtom.reportRead();
    return super.friends;
  }

  @override
  set friends(List<Map<String, dynamic>> value) {
    _$friendsAtom.reportWrite(value, super.friends, () {
      super.friends = value;
    });
  }

  final _$getFriendsListAsyncAction =
      AsyncAction('_StepTwoControllerBase.getFriendsList');

  @override
  Future<void> getFriendsList() {
    return _$getFriendsListAsyncAction.run(() => super.getFriendsList());
  }

  final _$_StepTwoControllerBaseActionController =
      ActionController(name: '_StepTwoControllerBase');

  @override
  void onChange(String value) {
    final _$actionInfo = _$_StepTwoControllerBaseActionController.startAction(
        name: '_StepTwoControllerBase.onChange');
    try {
      return super.onChange(value);
    } finally {
      _$_StepTwoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
friends: ${friends}
    ''';
  }
}