import 'package:flutter/material.dart';
import 'package:split_it/screens/home/widgets/event_tile_widget.dart';
import 'package:split_it/screens/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';

import 'home_controller.dart';
import 'home_state.dart';
import 'widgets/app_bar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getEvents();
    controller.listen(
      (state) {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //variavel utilizada para pegar o argumento
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        user: user,
        onTapAddButton: () {
          Navigator.pushNamed(context, '/create_split');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (controller.state is HomeStateLoading) ...[
                ...List.generate(
                    2,
                    (index) =>
                        EventTileWidget(isLoading: true, model: EventModel())),
              ] else if (controller.state is HomeStateSuccess) ...[
                ...(controller.state as HomeStateSuccess)
                    .events
                    .map(
                      (e) => EventTileWidget(model: e),
                    )
                    .toList()
              ] else if (controller is HomeStateFailure) ...[
                Text((controller.state as HomeStateFailure).message)
              ] else ...[
                Container()
              ]
            ],
          ),
        ),
      ),
    );
  }
}
