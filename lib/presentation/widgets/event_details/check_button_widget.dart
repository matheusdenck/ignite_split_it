import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class CheckButtonWidget extends StatelessWidget {
  final isEnabled;
  final VoidCallback onPressed;
  const CheckButtonWidget({
    Key? key,
    this.isEnabled = false,
    required this.onPressed,
  }) : super(key: key);

  Color get backgroundColor => isEnabled
      ? AppTheme.colors.checkBoxBackgroundEnabled
      : AppTheme.colors.checkBoxBackgroundDisabled;
  Color get centerColor => isEnabled
      ? AppTheme.colors.checkBoxEnabled
      : AppTheme.colors.checkBoxDisabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),
        child: Center(
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: centerColor,
            ),
            child: Center(
              child: isEnabled
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: AppTheme.colors.checkBoxBorder,
                              width: 1.5,
                            ),
                          )),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
