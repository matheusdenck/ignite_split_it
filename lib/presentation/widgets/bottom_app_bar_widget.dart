import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../shared/utils/store_state.dart';
import '../controllers/app_bar_controller.dart';
import 'info_card_widget.dart';

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        switch (controller.state) {
          case StoreState.loading:
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
          case StoreState.success:
            {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InfoCardWidget(value: controller.dashboard.receive),
                  SizedBox(
                    width: 21,
                  ),
                  InfoCardWidget(value: -controller.dashboard.send),
                ],
              );
            }
          case StoreState.error:
            {
              return Text('Erro na requisição');
            }
          default:
            {
              return SizedBox.shrink();
            }
        }
      },
    );
  }
}
