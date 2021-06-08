import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

enum IconDollarType { send, receive }

class IconDollarWidget extends StatelessWidget {
  final IconDollarType type;
  const IconDollarWidget({Key? key, required this.type}) : super(key: key);

  String get pathImage =>
      'assets/images/${type == IconDollarType.receive ? 'receber' : 'pagar'}.png';

  Color get backGroundColor => type == IconDollarType.receive
      ? AppTheme.colors.title.withOpacity(0.12)
      : AppTheme.colors.error.withOpacity(0.12);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backGroundColor,
            ),
          ),
          Center(
            child: SizedBox(
              width: 32,
              height: 32,
              child: Image.asset(pathImage),
            ),
          ),
        ],
      ),
    );
  }
}
