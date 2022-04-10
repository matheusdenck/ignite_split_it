import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/presentation/widgets/create_split/stepper_next_button_widget.dart';
import 'package:split_it/theme/app_theme.dart';

import '../../controllers/create_split_controller.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final CreateSplitController controller;
  final bool enabledButtons;
  BottomStepperBarWidget({
    Key? key,
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
        height: 61,
        child: Observer(
          builder: (_) => Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 1,
                color: controller.enableNavigateButton
                    ? AppTheme.colors.divider
                    : AppTheme.colors.dividerDisabled,
              ),
              Row(
                children: [
                  StepperNextButtonWidget(
                    label: 'CANCELAR',
                    enabled: controller.enableNavigateButton,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    width: 1,
                    height: 60,
                    color: controller.enableNavigateButton
                        ? AppTheme.colors.divider
                        : AppTheme.colors.dividerDisabled,
                  ),
                  StepperNextButtonWidget(
                    label:
                        controller.currentPage == 2 ? 'FINALIZAR' : 'CONTINUAR',
                    isLastStepPage: controller.currentPage == 2,
                    enabled: controller.enableNavigateButton,
                    onTap: onTapNext,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
