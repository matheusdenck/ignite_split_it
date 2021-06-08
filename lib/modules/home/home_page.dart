import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/event_tile_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';

import 'widgets/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final events = [
    EventModel(
        created: DateTime.now(), title: 'Churrasco', value: 50, people: 3),
    EventModel(
        created: DateTime.now(), title: 'Churrasco', value: -450, people: 13),
    EventModel(
        created: DateTime.now(), title: 'Churrasco', value: 50, people: 3),
    EventModel(
        created: DateTime.now(), title: 'Churrasco', value: -50, people: 3),
    EventModel(
        created: DateTime.now(), title: 'Churrasco', value: 50, people: 3),
    EventModel(
        created: DateTime.now(), title: 'Churrasco', value: -43, people: 3),
    EventModel(
        created: DateTime.now(), title: 'Churrasco', value: 50, people: 3),
  ];

  @override
  Widget build(BuildContext context) {
    //variavel utilizada para pegar o argumento
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(
        user: user,
        onTapAddButton: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...events
                  .map(
                    (e) => EventTileWidget(model: e),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
