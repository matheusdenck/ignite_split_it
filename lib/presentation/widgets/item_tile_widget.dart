import 'package:flutter/material.dart';
import 'package:split_it/shared/utils/formatters.dart';
import 'package:split_it/theme/app_theme.dart';

class ItemTileWidget extends StatelessWidget {
  final String name;
  final double value;
  final bool hasDivider;

  const ItemTileWidget({
    Key? key,
    required this.name,
    required this.value,
    this.hasDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: AppTheme.textStyles.eventTileTitle,
              ),
              Text(
                value.reais(),
                style: AppTheme.textStyles.eventTileTitle,
              ),
            ],
          ),
        ),
        hasDivider
            ? Divider(
                color: AppTheme.colors.dividerDisabled,
              )
            : SizedBox.shrink()
      ],
    );
  }
}
