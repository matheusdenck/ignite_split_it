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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 56,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.25,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.colors.backgroundSecondary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.fromBorderSide(
                    BorderSide(color: AppTheme.colors.white, width: 1.5),
                  ),
                ),
              ),
            ),
            Center(
              child: Icon(
                Icons.add,
                color: AppTheme.colors.addButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
