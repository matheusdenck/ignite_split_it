// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventDetailsController on _EventDetailsControllerBase, Store {
  final _$eventDetailStateAtom =
      Atom(name: '_EventDetailsControllerBase.eventDetailState');

  @override
  StoreState get eventDetailState {
    _$eventDetailStateAtom.reportRead();
    return super.eventDetailState;
  }

  @override
  set eventDetailState(StoreState value) {
    _$eventDetailStateAtom.reportWrite(value, super.eventDetailState, () {
      super.eventDetailState = value;
    });
  }

  final _$deleteAsyncAction = AsyncAction('_EventDetailsControllerBase.delete');

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  final _$_EventDetailsControllerBaseActionController =
      ActionController(name: '_EventDetailsControllerBase');

  @override
  void updateState(StoreState newState) {
    final _$actionInfo = _$_EventDetailsControllerBaseActionController
        .startAction(name: '_EventDetailsControllerBase.updateState');
    try {
      return super.updateState(newState);
    } finally {
      _$_EventDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventDetailState: ${eventDetailState}
    ''';
  }
}
