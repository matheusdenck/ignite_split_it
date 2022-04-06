import 'package:mobx/mobx.dart';

import '../../data/models/item_model.dart';

part 'step_three_controller.g.dart';

class StepThreeController = _StepThreeControllerBase with _$StepThreeController;

abstract class _StepThreeControllerBase with Store {
  @observable
  ObservableList<ItemModel> itensList = ObservableList.of([]);

  @observable
  ItemModel item = ItemModel();

  @computed
  bool get showButton => item.name.isNotEmpty && item.value != 0;

  @computed
  int get currentIndex => itensList.length + 1;

  @action
  void onChanged({String? name, double? value}) {
    item = item.copyWith(name: name, value: value);
  }

  @action
  void addItem() {
    itensList.add(item);
    //limpa a variável item logo depois de adicionar na lista
    item = ItemModel();
  }

  @action
  void removeItem(int index) {
    itensList.removeAt(index);
  }

  void editItem(
    int index, {
    String? name,
    double? value,
  }) {
    itensList[index] = itensList[index].copyWith(name: name, value: value);
  }
}
