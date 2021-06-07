import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/app_bar/widgets/transaction_card_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

import 'widgets/add_button_widget.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({
    required this.user,
  }) : super(
          preferredSize: Size.fromHeight(328),
          child: Container(
            height: 328,
            child: Stack(
              children: [
                Container(
                  height: 244,
                  color: AppTheme.colors.backgroundSecondary,
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
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TransactionCard(),
                      SizedBox(
                        width: 21,
                      ),
                      TransactionCard(isGreen: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}
