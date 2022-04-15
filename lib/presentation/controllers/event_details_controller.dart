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
}
