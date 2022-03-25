import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../controllers/step_two_controller.dart';
import '../../../widgets/create_split/person_tile_widget.dart';
import '../../../widgets/create_split/step_input_text_widget.dart';
import '../../../widgets/create_split/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  const StepTwoPage({Key? key}) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  final controller = StepTwoController();
  @override
  void initState() {
    controller.getFriendsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(title: 'Com quem', subtitle: '\nvocê quer dividir?'),
        StepInputTextWidget(
          onChange: (value) {
            controller.onChange(value);
          },
          hintText: 'Nome da pessoa',
        ),
        SizedBox(height: 34),
        Observer(builder: (_) {
          if (controller.friends.isEmpty) {
            return Text('Nenhum amigo encontrado');
          } else {
            return Column(
              children: controller.friends
                  .map((e) => PersonTileWidget(name: e['name']))
                  .toList(),
            );
          }
        }),
      ],
    );
  }
}
