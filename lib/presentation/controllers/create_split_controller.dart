import 'package:mobx/mobx.dart';
import 'package:split_it/data/models/event_model.dart';
import 'package:split_it/domain/repositories/firebase_repository.dart';

import '../../data/models/friend_model.dart';
import '../../data/models/item_model.dart';
import '../../shared/utils/store_state.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  final FirebaseRepository repository;

  _CreateSplitControllerBase({required this.repository});

  @observable
  int currentPage = 0;

  @observable
  EventModel event = EventModel();

  @observable
  StoreState status = StoreState.initial;

  @action
  Future<void> saveEvent() async {
    try {
      status = StoreState.loading;
      final response = await repository.create(event);
      print(response);
      status = StoreState.success;
    } catch (e) {
      status = StoreState.error;
    }
  }

  @computed
  bool get enableNavigateButton {
    if (event.name.isNotEmpty && currentPage == 0) {
      return true;
    } else if (event.friendsList.isNotEmpty && currentPage == 1) {
      return true;
    } else if (event.itensList.isNotEmpty && currentPage == 2) {
      return true;
    }
    return false;
  }

  @action
  void nextPage() {
    if (currentPage < 2) {
      currentPage++;
    }
  }

  @action
  void backPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @action
  void onEventChanged({
    String? name,
    List<ItemModel>? listItemModel,
    List<FriendModel>? listFriendModel,
  }) {
    event = event.copyWith(
      name: name,
      itensList: listItemModel,
      friendsList: listFriendModel,
    );
  }
}
