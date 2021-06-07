import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //variavel utilizada para pegar o argumento
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(user: user),
    );
  }
}
