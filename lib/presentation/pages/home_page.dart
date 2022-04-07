import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/data/models/user_model.dart';
import 'package:split_it/domain/repositories/home_repository_firebase.dart';
import 'package:split_it/shared/utils/store_state.dart';

import '../../data/models/event_model.dart';
import '../controllers/home_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/event_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(repository: HomeRepositoryFirebase());

  @override
  void initState() {
    controller.getEvents();
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
              Observer(
                builder: (context) {
                  if (controller.state == StoreState.loading) {
                    return Column(
                      children: List.generate(
                        2,
                        (index) => EventTileWidget(
                          isLoading: true,
                          model: EventModel(),
                        ),
                      ),
                    );
                  } else if (controller.state == StoreState.success) {
                    return Column(
                      children: controller.events
                          .map(
                            (e) => EventTileWidget(model: e),
                          )
                          .toList(),
                    );
                  } else if (controller.state == StoreState.error) {
                    return Text('Erro no carregamento das infos');
                  } else
                    return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
