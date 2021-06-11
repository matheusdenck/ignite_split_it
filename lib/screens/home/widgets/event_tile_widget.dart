import 'package:flutter/material.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';
import 'dart:math';

import 'icon_dollar_widget.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel model;

  const EventTileWidget({Key? key, required this.model}) : super(key: key);

  IconDollarType get type =>
      model.value >= 0 ? IconDollarType.receive : IconDollarType.send;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconDollarWidget(type: type),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(model.title,
                      style: AppTheme.textStyles.eventTileTitle),
                  subtitle: Text(model.created.toString(),
                      style: AppTheme.textStyles.eventTileSubtitle),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('R\$${(model.value.abs()).toStringAsFixed(2)}',
                          style: AppTheme.textStyles.eventTileMoney),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          '${model.people.toStringAsFixed(0)} pessoa${model.people == 1 ? '' : 's'}',
                          style: AppTheme.textStyles.eventTilePeople),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
