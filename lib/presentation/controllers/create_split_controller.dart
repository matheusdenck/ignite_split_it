import 'package:mobx/mobx.dart';

import '../../data/models/friend_model.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitControllerBase
    with _$CreateSplitController;

abstract class _CreateSplitControllerBase with Store {
  @observable
  int currentPage = 0;

  @observable
  String eventName = '';

  @observable
  List<FriendModel> selectedFriends = <FriendModel>[];

  @action
  void setSelectedFriends(List<FriendModel> list) {
    selectedFriends = list;
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

  @computed
  bool get enableNavigateButton {
    if (eventName.isNotEmpty && currentPage == 0) {
      return true;
    } else if (selectedFriends.isNotEmpty && currentPage == 1) {
      return true;
    }
    return false;
  }

  @action
  void setEventName(String name) {
    eventName = name;
  }
}
