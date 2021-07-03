import 'package:flutter/material.dart';
import 'package:split_it/screens/create_split/widgets/create_split_app_bar_widget.dart';
import 'package:split_it/screens/create_split/widgets/stepper_next_button_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.purple,
    ),
  ];

  var index = 0;

  void nextPage() {
    if (index < 2) {
      index++;
      setState(() {});
    }
  }

  void backPage() {
    if (index > 0) {
      index--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      appBar: CreateSplitAppBarWidget(
        onTapBack: backPage,
        size: pages.length,
        actualPage: index,
      ),
      body: pages[index],
      bottomNavigationBar: SafeArea(
          bottom: true,
          child: Container(
            height: 56,
            child: Row(
              children: [
                StepperNextButtonWidget(
                    label: 'CANCELAR',
                    onTap: () {
                      backPage();
                    }),
                Container(
                  width: 1,
                  color: AppTheme.colors.divider.withOpacity(0.2),
                ),
                StepperNextButtonWidget(
                    label: 'CONTINUAR',
                    onTap: () {
                      nextPage();
                    }),
              ],
            ),
          )),
    );
  }
}
