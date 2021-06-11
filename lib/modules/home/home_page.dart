import 'package:flutter/material.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/repositories/home_repository_mock.dart';
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
  final events = <EventModel>[];
  late HomeRepository repository;
  void getEvents() async {
    final response = await repository.getEvents();
    events.addAll(response);
    setState(() {});
  }

  @override
  void initState() {
    repository = HomeRepositoryMock();
    getEvents();
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