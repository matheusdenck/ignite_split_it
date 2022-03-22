import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class AddButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  AddButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 56,
        decoration: BoxDecoration(
          color: AppTheme.colors.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
                color: AppTheme.colors.white.withOpacity(0.25), width: 1.5),
          ),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: AppTheme.colors.addButton,
          ),
        ),
      ),
    );
  }
}
