import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class SocialButtonWidget extends StatelessWidget {
  final String imagePath;
  final String label;

  const SocialButtonWidget(
      {Key? key, required this.imagePath, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.fromBorderSide(BorderSide(color: AppTheme.colors.border))),
      child: Row(
        children: [
          Container(
              width: 56,
              height: 56,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 15.0),
                    child: Image.asset(imagePath),
                  ),
                  Container(width: 1, color: AppTheme.colors.border),
                ],
              )),
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  label,
                  style: AppTheme.textStyles.button,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
