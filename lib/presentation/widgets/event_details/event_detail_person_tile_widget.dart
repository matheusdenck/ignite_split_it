import 'package:flutter/material.dart';
import 'package:split_it/presentation/widgets/event_details/check_button_widget/check_button_widget.dart';
import 'package:split_it/shared/utils/formatters.dart';

import '../../../data/models/event_model.dart';
import '../../../data/models/friend_model.dart';
import '../../../theme/app_theme.dart';

class EventDetailPersonTileWidget extends StatelessWidget {
  final FriendModel friend;
  final double value;
  final EventModel event;

  EventDetailPersonTileWidget({
    Key? key,
    required this.friend,
    required this.value,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(friend.photoURL),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        friend.name,
        style: AppTheme.textStyles.eventDetailPersonTileTitle,
      ),
      subtitle: Text(
        value.reais(),
        style: friend.isPaid
            ? AppTheme.textStyles.eventDetailPersonTileSubtitlePaid
            : AppTheme.textStyles.eventDetailPersonTileSubtitleUnpaid,
      ),
      trailing: CheckButtonWidget(
        event: event,
        friend: friend,
      ),
    );
  }
}
