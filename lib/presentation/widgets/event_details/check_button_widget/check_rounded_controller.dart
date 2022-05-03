import 'package:mobx/mobx.dart';
import 'package:split_it/domain/repositories/firebase_repository.dart';

import '../../../../data/models/event_model.dart';
import '../../../../data/models/friend_model.dart';
import '../../../../shared/utils/store_state.dart';

part 'check_rounded_controller.g.dart';

class CheckRoundedController = _CheckRoundedControllerBase
    with _$CheckRoundedController;

abstract class _CheckRoundedControllerBase with Store {
  final FirebaseRepository repository;
  final EventModel event;

  _CheckRoundedControllerBase({
    required this.repository,
    required this.event,
  });

  @observable
  StoreState state = StoreState.initial;

  @action
  Future<void> update(FriendModel friend) async {
    try {
      state = StoreState.loading;
      final friends = event.friendsList;
      final indexWhere =
          event.friendsList.indexWhere((element) => element == friend);
      final isPaid = !friends[indexWhere].isPaid;
      friends[indexWhere] = friends[indexWhere].copyWith(isPaid: isPaid);
      final model = event.copyWith(friendsList: friends);
      await repository.update(
          id: event.id, collection: '/events', model: model);
      if (isPaid) {
        state = StoreState.success;
      } else {
        state = StoreState.initial;
      }
      print(state);
    } catch (e) {
      state = StoreState.error;
    }
  }
}
