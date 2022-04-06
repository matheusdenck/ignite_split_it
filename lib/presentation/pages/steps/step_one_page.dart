import 'package:flutter/material.dart';

import '../../controllers/create_split_controller.dart';
import '../../widgets/create_split/step_input_text_widget.dart';
import '../../widgets/create_split/step_title_widget.dart';

class StepOnePage extends StatefulWidget {
  final CreateSplitController createSplitController;
  StepOnePage({Key? key, required this.createSplitController})
      : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(title: 'Qual o nome', subtitle: '\ndo evento?'),
        StepInputTextWidget(
          onChange: (value) {
            widget.createSplitController.onEventChanged(name: value);
          },
          hintText: 'Ex: Churrasco',
        )
      ],
    );
  }
}
