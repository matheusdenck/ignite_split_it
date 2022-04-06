import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/presentation/widgets/create_split/stepper_next_button_widget.dart';
import 'package:split_it/theme/app_theme.dart';

import '../../controllers/create_split_controller.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final CreateSplitController controller;
  final bool enabledButtons;
  BottomStepperBarWidget({
    Key? key,
    required this.onTapCancel,
    this.enabledButtons = false,
    required this.controller,
  }) : super(key: key);

  void onTapNext() {
    if (controller.currentPage == 2) {
      controller.saveEvent();
    } else {
      controller.nextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 56,
        child: Row(
          children: [
            Observer(
              builder: (context) => StepperNextButtonWidget(
                label: 'CANCELAR',
                enabled: controller.enableNavigateButton,
                onTap: onTapCancel,
              ),
            ),
            Container(
              width: 1,
              color: AppTheme.colors.divider.withOpacity(0.2),
            ),
            Observer(
              builder: (context) => StepperNextButtonWidget(
                label: controller.currentPage == 2 ? 'FINALIZAR' : 'CONTINUAR',
                enabled: controller.enableNavigateButton,
                onTap: onTapNext,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
