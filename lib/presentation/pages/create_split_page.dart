import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/domain/repositories/firebase_repository.dart';
import 'package:split_it/presentation/pages/steps/step_one_page.dart';
import 'package:split_it/presentation/pages/steps/step_three_page.dart';
import 'package:split_it/presentation/pages/steps/step_two_page.dart';
import 'package:split_it/theme/app_theme.dart';

import '../controllers/create_split_controller.dart';
import '../widgets/create_split/bottom_stepper_bar_widget.dart';
import '../widgets/create_split/create_split_app_bar_widget.dart';
import 'steps/step_four_page.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final createSplitController =
      CreateSplitController(repository: FirebaseRepository());

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(
        createSplitController: createSplitController,
      ),
      StepTwoPage(
        createSplitController: createSplitController,
      ),
      StepThreePage(
        createSplitController: createSplitController,
      ),
      StepFourPage(
        createSplitController: createSplitController,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      appBar: CreateSplitAppBarWidget(
        onTapBack: () {
          createSplitController.currentPage == 0
              ? Navigator.of(context).pop()
              : createSplitController.backPage();
        },
        size: pages.length,
        controller: createSplitController,
      ),
      body: Observer(builder: (_) {
        final index = createSplitController.currentPage;
        return pages[index];
      }),
      bottomNavigationBar: BottomStepperBarWidget(
          controller: createSplitController,
          onTapCancel: () {
            Navigator.of(context).pop();
          }),
    );
  }
}
