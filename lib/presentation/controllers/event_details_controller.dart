import 'package:mobx/mobx.dart';
import 'package:split_it/domain/repositories/firebase_repository.dart';
import 'package:split_it/shared/utils/store_state.dart';

part 'event_details_controller.g.dart';

class EventDetailsController = _EventDetailsControllerBase
    with _$EventDetailsController;

abstract class _EventDetailsControllerBase with Store {
  final FirebaseRepository firebaseRepository;

  _EventDetailsControllerBase({required this.firebaseRepository});

  @observable
  StoreState eventDetailState = StoreState.initial;

  @action
  void updateState(StoreState newState) {
    eventDetailState = newState;
  }

  @action
  Future<void> delete(String id) async {
    updateState(StoreState.loading);
    final response = await this.firebaseRepository.delete(
          id: id,
          collection: '/events',
        );
    if (response) {
      updateState(StoreState.success);
    } else {
      updateState(StoreState.error);
    }
  }
}
