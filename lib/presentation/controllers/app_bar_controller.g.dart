// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppBarController on _AppBarControllerBase, Store {
  final _$stateAtom = Atom(name: '_AppBarControllerBase.state');

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

  final _$dashboardAtom = Atom(name: '_AppBarControllerBase.dashboard');

  @override
  DashboardModel get dashboard {
    _$dashboardAtom.reportRead();
    return super.dashboard;
  }

  @override
  set dashboard(DashboardModel value) {
    _$dashboardAtom.reportWrite(value, super.dashboard, () {
      super.dashboard = value;
    });
  }

  final _$getDashboardAsyncAction =
      AsyncAction('_AppBarControllerBase.getDashboard');

  @override
  Future<void> getDashboard() {
    return _$getDashboardAsyncAction.run(() => super.getDashboard());
  }

  @override
  String toString() {
    return '''
state: ${state},
dashboard: ${dashboard}
    ''';
  }
}
