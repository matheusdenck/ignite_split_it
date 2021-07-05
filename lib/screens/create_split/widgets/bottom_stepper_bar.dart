import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:split_it/screens/create_split/widgets/stepper_next_button_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;
  BottomStepperBarWidget(
      {Key? key, required this.onTapCancel, required this.onTapNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 56,
        child: Row(
          children: [
            StepperNextButtonWidget(label: 'CANCELAR', onTap: onTapCancel),
            Container(
              width: 1,
              color: AppTheme.colors.divider.withOpacity(0.2),
            ),
            StepperNextButtonWidget(label: 'CONTINUAR', onTap: onTapNext),
          ],
        ),
      ),
    );
  }
}
