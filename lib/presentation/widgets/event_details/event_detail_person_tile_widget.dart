import 'package:flutter/material.dart';
import 'package:split_it/presentation/widgets/event_details/check_button_widget.dart';
import 'package:split_it/shared/utils/formatters.dart';

import '../../../data/models/friend_model.dart';
import '../../../theme/app_theme.dart';

class EventDetailPersonTileWidget extends StatelessWidget {
  final bool isPaid;
  final VoidCallback onPressed;
  final FriendModel friend;
  final double value;
  EventDetailPersonTileWidget({
    Key? key,
    this.isPaid = false,
    required this.onPressed,
    required this.friend,
    required this.value,
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
        style: isPaid
            ? AppTheme.textStyles.eventDetailPersonTileSubtitlePaid
            : AppTheme.textStyles.eventDetailPersonTileSubtitleUnpaid,
      ),
      trailing: CheckButtonWidget(
        isEnabled: isPaid,
        onPressed: onPressed,
      ),
    );
  }
}
