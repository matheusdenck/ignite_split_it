import 'package:flutter/material.dart';
import 'package:split_it/data/models/event_model.dart';
import 'package:split_it/presentation/widgets/event_details/event_detail_person_tile_widget.dart';
import 'package:split_it/presentation/widgets/item_tile_widget.dart';

import '../../theme/app_theme.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel event;
  const EventDetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.white,
      child: Scaffold(
        backgroundColor: AppTheme.colors.eventDetailDivider,
        appBar: AppBar(
          backgroundColor: AppTheme.colors.white,
          elevation: 0,
          title: Text(
            widget.event.name,
            style: AppTheme.textStyles.appBarEventDetailsTitle,
          ),
          centerTitle: true,
          leading: BackButton(color: AppTheme.colors.backButton),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: AppTheme.colors.backButton,
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                color: AppTheme.colors.white,
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'INTEGRANTES',
                      style: AppTheme.textStyles.eventDetailSubtitle,
                    ),
                    ...widget.event.friendsList
                        .map(
                          (e) => EventDetailPersonTileWidget(
                            onPressed: () {},
                            friend: e,
                            value: widget.event.calcValue,
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                color: AppTheme.colors.white,
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ITENS',
                      style: AppTheme.textStyles.eventDetailSubtitle,
                    ),
                    //TODO: criar componente de itens
                    ...widget.event.itensList
                        .map(
                          (e) => ItemTileWidget(
                            model: e,
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
