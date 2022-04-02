import 'package:flutter/material.dart';
import 'package:split_it/data/models/friend_model.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTileWidget extends StatelessWidget {
  final FriendModel friendData;
  final bool isRemovable;
  final VoidCallback onPressed;
  const PersonTileWidget({
    Key? key,
    required this.friendData,
    this.isRemovable = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
            image: DecorationImage(
              image: NetworkImage(friendData.photoURL),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(friendData.name,
            style: isRemovable
                ? AppTheme.textStyles.personTileTitleSelected
                : AppTheme.textStyles.personTileTitle),
        trailing: IconButton(
          icon: isRemovable
              ? Icon(Icons.remove, color: AppTheme.colors.error)
              : Icon(Icons.add, color: AppTheme.colors.success),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
