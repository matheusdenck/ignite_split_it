import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

import 'icon_dollar_widget.dart';
import 'loading_widget.dart';

class InfoCardWidget extends StatelessWidget {
  final double value;
  final bool isLoading;
  const InfoCardWidget({
    Key? key,
    required this.value,
    this.isLoading = false,
  }) : super(key: key);

  TextStyle get textStyle => value >= 0
      ? AppTheme.textStyles.infoCardSubtitle1
      : AppTheme.textStyles.infoCardSubtitle2;

  IconDollarType get iconDollarType =>
      value >= 0 ? IconDollarType.receive : IconDollarType.send;

  String get title => value >= 0 ? 'A receber:' : 'A pagar:';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 168,
      padding: EdgeInsets.only(
        top: 16,
        bottom: 16,
        left: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.colors.white,
        border: Border.fromBorderSide(
          BorderSide(
            color: AppTheme.colors.border,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconDollarWidget(
            type: iconDollarType,
          ),
          SizedBox(
            height: 40,
          ),
          Text(title, style: AppTheme.textStyles.infoCardTitle),
          SizedBox(
            height: 4,
          ),
          if (isLoading) ...[
            LoadingWidget(
              size: Size(94, 24),
            )
          ] else ...[
            Text(
              'R\$${(value.abs()).toStringAsFixed(2)}',
              style: textStyle,
            ),
          ],
        ],
      ),
    );
  }
}
