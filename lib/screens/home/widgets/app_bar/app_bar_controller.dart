import 'package:split_it/screens/home/repositories/home_repository.dart';
import 'package:split_it/screens/home/repositories/home_repository_mock.dart';
import 'package:split_it/screens/home/widgets/app_bar/app_bar_state.dart';

class AppBarController {
  late HomeRepository repository;

  AppBarState state = AppBarStateEmpty();

  AppBarController() {
    repository = HomeRepositoryMock();
  }

  getDashboard() async {
    state = AppBarStateLoading();
    final response = await repository.getDashboard();
    state = AppBarStateSuccess(dashboard: response);
  }
}
