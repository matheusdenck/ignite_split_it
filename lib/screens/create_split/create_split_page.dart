import 'package:flutter/material.dart';
import 'package:split_it/screens/create_split/steps/one/step_one_page.dart';
import 'package:split_it/screens/create_split/widgets/bottom_stepper_bar.dart';
import 'package:split_it/screens/create_split/widgets/create_split_app_bar_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final pages = [
    StepOnePage(
      onChange: (value) {
        print(value);
      },
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
      bottomNavigationBar:
          BottomStepperBarWidget(onTapNext: nextPage, onTapCancel: backPage),
    );
  }
}
