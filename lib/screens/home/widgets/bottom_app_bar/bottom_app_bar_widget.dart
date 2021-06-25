import 'package:flutter/material.dart';
import 'package:split_it/screens/home/models/dashboard_model.dart';
import 'package:split_it/screens/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/screens/home/widgets/app_bar/app_bar_state.dart';

import '../info_card_widget.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  final controller = AppBarController();

  @override
  void initState() {
    controller.getDashboard();
    controller.listen((state) {
      setState(
        () {},
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (controller.state.runtimeType) {
      case AppBarStateLoading:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InfoCardWidget(
                value: 0,
                isLoading: true,
              ),
              SizedBox(
                width: 21,
              ),
              InfoCardWidget(
                value: -1,
                isLoading: true,
              ),
            ],
          );
        }
      case AppBarStateSuccess:
        {
          final dashboard = (controller.state as AppBarStateSuccess).dashboard;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InfoCardWidget(value: dashboard.receive),
              SizedBox(
                width: 21,
              ),
              InfoCardWidget(value: -dashboard.send),
            ],
          );
        }
      case AppBarStateFailure:
        {
          final message = (controller.state as AppBarStateFailure).message;
          return Text(message);
        }
      default:
        {
          return Container();
        }
    }
  }
}
