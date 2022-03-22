import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_it/data/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

import 'add_button_widget.dart';
import 'bottom_app_bar_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onTapAddButton;
  AppBarWidget({
    required this.onTapAddButton,
    required this.user,
  }) : super(
          preferredSize: Size.fromHeight(328),
          child: Container(
            height: 328,
            child: Stack(
              children: [
                Container(
                  height: 244,
                  color: AppTheme.colors.background,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 64, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Image.network(user.photoUrl!))),
                      SizedBox(width: 16),
                      Text(
                        user.name!,
                        style: AppTheme.textStyles.userName,
                      ),
                      SizedBox(width: 16),
                      AddButtonWidget(
                        onTap: onTapAddButton,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: BottomAppBarWidget(),
                ),
              ],
            ),
          ),
        );
}
