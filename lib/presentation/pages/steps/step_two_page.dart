import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/presentation/controllers/create_split_controller.dart';

import '../../controllers/step_two_controller.dart';
import '../../widgets/create_split/person_tile_widget.dart';
import '../../widgets/create_split/step_input_text_widget.dart';
import '../../widgets/create_split/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  final CreateSplitController createSplitController;
  const StepTwoPage({
    Key? key,
    required this.createSplitController,
  }) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  late StepTwoController createSplitController;

  @override
  void initState() {
    createSplitController = StepTwoController(
      createSplitController: widget.createSplitController,
    );
    createSplitController.getFriendsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(title: 'Com quem', subtitle: '\nvocê quer dividir?'),
        StepInputTextWidget(
          onChange: (value) {
            createSplitController.onChange(value);
          },
          hintText: 'Nome da pessoa',
        ),
        SizedBox(height: 34),
        Observer(
          builder: (_) {
            if (createSplitController.selectedFriends.isEmpty) {
              return SizedBox.shrink();
            } else {
              return Column(
                children: [
                  ...createSplitController.selectedFriends
                      .map(
                        (e) => PersonTileWidget(
                          friendData: e,
                          isRemovable: true,
                          onPressed: () {
                            createSplitController.removeFriend(e);
                          },
                        ),
                      )
                      .toList(),
                  SizedBox(height: 16),
                ],
              );
            }
          },
        ),
        Observer(
          builder: (_) {
            if (createSplitController.items.isEmpty) {
              return Text('Nenhum amigo encontrado');
            } else {
              return Column(
                children: createSplitController.items
                    .map(
                      (e) => PersonTileWidget(
                        friendData: e,
                        onPressed: () {
                          createSplitController.addFriend(e);
                        },
                      ),
                    )
                    .toList(),
              );
            }
          },
        ),
      ],
    );
  }
}
