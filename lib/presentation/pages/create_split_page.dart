import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/presentation/pages/steps/one/step_one_page.dart';
import 'package:split_it/presentation/pages/steps/three/step_three_page.dart';
import 'package:split_it/presentation/pages/steps/two/step_two_page.dart';
import 'package:split_it/theme/app_theme.dart';

import '../controllers/create_split_controller.dart';
import '../widgets/create_split/bottom_stepper_bar_widget.dart';
import '../widgets/create_split/create_split_app_bar_widget.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(
        controller: controller,
      ),
      StepTwoPage(
        createSplitController: controller,
      ),
      StepThreePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      appBar: CreateSplitAppBarWidget(
        onTapBack: () {
          controller.currentPage == 0
              ? Navigator.of(context).pop()
              : controller.backPage();
        },
        size: pages.length,
        controller: controller,
      ),
      body: Observer(builder: (_) {
        final index = controller.currentPage;
        return pages[index];
      }),
      bottomNavigationBar: BottomStepperBarWidget(
          controller: controller,
          onTapNext: controller.nextPage,
          onTapCancel: () {
            Navigator.of(context).pop();
          }),
    );
  }
}
