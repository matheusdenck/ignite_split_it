import 'package:flutter/material.dart';
import 'package:split_it/screens/create_split/widgets/step_input_text_widget.dart';
import 'package:split_it/screens/create_split/widgets/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  const StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(title: 'Com quem', subtitle: '\nvocê quer dividir?'),
        StepInputTextWidget(
          onChange: (value) {},
          hintText: 'Nome da pessoa',
        ),
      ],
    );
  }
}
