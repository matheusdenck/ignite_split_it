import 'package:mobx/mobx.dart';
import 'package:split_it/data/models/friend_model.dart';
import 'package:split_it/domain/repositories/firebase_repository.dart';
import 'package:split_it/presentation/controllers/create_split_controller.dart';

part 'step_two_controller.g.dart';

class StepTwoController = _StepTwoControllerBase with _$StepTwoController;

abstract class _StepTwoControllerBase with Store {
  final CreateSplitController createSplitController;
  final repository = FirebaseRepository();

  _StepTwoControllerBase({required this.createSplitController}) {
    autorun((_) {
      createSplitController.onEventChanged(listFriendModel: _selectedFriends);
    });
  }

  @observable
  List<FriendModel> _friends = [];

  @observable
  ObservableList<FriendModel> _selectedFriends = ObservableList.of([]);

  List<FriendModel> get selectedFriends => _selectedFriends;

  @observable
  String search = '';

  @action
  void onChange(String value) {
    search = value;
  }

  @action
  void addFriend(FriendModel friend) {
    // USING MOBX OBSERVABLE LIST
    _selectedFriends.add(friend);

    // USING FLUTTER LIST
    // final list = [];
    // list.add(friend);
    // _selectedFriends = List.from(list);
  }

  @action
  void removeFriend(FriendModel friend) {
    _selectedFriends.remove(friend);
  }

  @computed
  List<FriendModel> get items {
    if (_selectedFriends.isNotEmpty) {
      final filteredList = _friends.where((element) {
        final contains = element.name
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase());
        final existingFriend = _selectedFriends.contains(element);
        return contains && !existingFriend;
      }).toList();
      return filteredList;
    }
    if (search.isEmpty) {
      return _friends;
    } else {
      final filteredList = _friends
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
      return filteredList;
    }
  }

  @action
  Future<void> getFriendsList() async {
    final response = await this.repository.get(collection: '/friends');
    _friends = response.map((e) => FriendModel.fromMap(e)).toList();
  }
}
