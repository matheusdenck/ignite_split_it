import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/domain/repositories/firebase_repository.dart';
import 'package:split_it/presentation/pages/create_split_success_page.dart';
import 'package:split_it/presentation/pages/steps/step_one_page.dart';
import 'package:split_it/presentation/pages/steps/step_three_page.dart';
import 'package:split_it/presentation/pages/steps/step_two_page.dart';
import 'package:split_it/shared/utils/store_state.dart';
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
  final createSplitController =
      CreateSplitController(repository: FirebaseRepository());

  late List<Widget> pages;
  late ReactionDisposer _disposer;

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
      CreateSplitSuccessPage(
        createSplitController: createSplitController,
      ),
    ];
    _disposer = autorun((_) {
      if (createSplitController.status == StoreState.success) {
        BotToast.closeAllLoading();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => CreateSplitSuccessPage(
                  createSplitController: createSplitController,
                )),
          ),
        );
      } else if (createSplitController.status == StoreState.error) {
        BotToast.closeAllLoading();
        BotToast.showText(text: 'Não foi possível cadastrar esse evento');
      } else if (createSplitController.status == StoreState.loading) {
        BotToast.showLoading();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  bool backButtonNavigation() {
    if (createSplitController.currentPage == 0) {
      return true;
    } else {
      createSplitController.backPage();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => backButtonNavigation(),
      child: Scaffold(
        backgroundColor: AppTheme.colors.white,
        appBar: CreateSplitAppBarWidget(
          onTapBack: () {
            if (backButtonNavigation()) Navigator.pop(context);
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
        ),
      ),
    );
  }
}
