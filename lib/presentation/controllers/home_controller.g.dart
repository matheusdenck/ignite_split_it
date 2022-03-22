// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$stateAtom = Atom(name: '_HomeControllerBase.state');

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

  final _$eventsAtom = Atom(name: '_HomeControllerBase.events');

  @override
  List<EventModel> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(List<EventModel> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  final _$getEventsAsyncAction = AsyncAction('_HomeControllerBase.getEvents');

  @override
  Future<void> getEvents() {
    return _$getEventsAsyncAction.run(() => super.getEvents());
  }

  @override
  String toString() {
    return '''
state: ${state},
events: ${events}
    ''';
  }
}
