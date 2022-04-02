import 'package:flutter/material.dart';

import '../../../widgets/add_text_button_widget.dart';
import '../../../widgets/create_split/step_title_widget.dart';
import '../../../widgets/step_multi_input_text_widget.dart';

class StepThreePage extends StatefulWidget {
  const StepThreePage({Key? key}) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(
          title: 'Qual ou quais',
          subtitle: '\nitens você quer dividir?',
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: StepMultiInputText(
            count: 1,
            itemName: (value) {},
            itemValue: (value) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: AddTextButton(label: 'Continuar', onPressed: () {}),
        ),
      ],
    );
  }
}
