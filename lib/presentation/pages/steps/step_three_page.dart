import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/presentation/controllers/create_split_controller.dart';
import 'package:split_it/presentation/controllers/step_three_controller.dart';

import '../../widgets/add_text_button_widget.dart';
import '../../widgets/create_split/step_title_widget.dart';
import '../../widgets/step_multi_input_text_widget.dart';

class StepThreePage extends StatefulWidget {
  final CreateSplitController createSplitController;
  StepThreePage({
    Key? key,
    required this.createSplitController,
  }) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  final stepThreeController = StepThreeController();
  late ReactionDisposer _disposer;

  @override
  void initState() {
    _disposer = autorun((_) {
      widget.createSplitController.onEventChanged(
          listItemModel: stepThreeController.itensList.toList());
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StepTitleWidget(
            title: 'Qual ou quais',
            subtitle: '\nitens você quer dividir?',
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.only(top: 24),
              child: StepMultiInputText(
                //chave unica adicionada pra quando a arvore de widgets for remontada, entregar uma instância nova do widget
                key: UniqueKey(),
                count: stepThreeController.currentIndex,
                itemName: (value) {
                  stepThreeController.onChanged(name: value);
                },
                itemValue: (value) {
                  stepThreeController.onChanged(value: value);
                },
              ),
            ),
          ),
          Observer(
            builder: (_) => stepThreeController.showButton
                ? Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: AddTextButton(
                      label: 'Continuar',
                      onPressed: () {
                        stepThreeController.addItem();
                      },
                    ),
                  )
                : SizedBox.shrink(),
          ),
          Observer(
            builder: (_) => Column(children: [
              for (var i = 0; i < stepThreeController.itensList.length; i++)
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: StepMultiInputText(
                    key: Key([i].hashCode.toString()),
                    isRemovable: true,
                    initialName: stepThreeController.itensList[i].name,
                    initialValue: stepThreeController.itensList[i].value,
                    count: i + 1,
                    itemName: (value) {
                      stepThreeController.editItem(i, name: value);
                    },
                    itemValue: (value) {
                      stepThreeController.editItem(i, value: value);
                    },
                    onDelete: () {
                      stepThreeController.removeItem(i);
                    },
                  ),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
