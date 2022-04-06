import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/presentation/widgets/loading_widget.dart';
import 'package:split_it/theme/app_theme.dart';

import '../../../data/models/event_model.dart';
import 'icon_dollar_widget.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel model;
  final bool isLoading;

  const EventTileWidget({Key? key, required this.model, this.isLoading = false})
      : super(key: key);

  IconDollarType get type =>
      model.value >= 0 ? IconDollarType.receive : IconDollarType.send;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        children: [
          LoadingWidget(size: Size(48, 48)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: LoadingWidget(size: Size(81, 19)),
                    subtitle: LoadingWidget(size: Size(52, 18)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingWidget(size: Size(61, 17)),
                        SizedBox(
                          height: 5,
                        ),
                        LoadingWidget(size: Size(44, 18)),
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
                  title: Text(model.name,
                      style: AppTheme.textStyles.eventTileTitle),
                  subtitle: Text(
                      '${DateFormat('d MMMM', Intl.systemLocale).format(model.created!)}',
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
