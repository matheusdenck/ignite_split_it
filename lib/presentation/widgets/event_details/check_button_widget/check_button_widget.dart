import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/data/models/friend_model.dart';
import 'package:split_it/domain/repositories/firebase_repository.dart';
import 'package:split_it/presentation/widgets/event_details/check_button_widget/check_rounded_controller.dart';

import '../../../../data/models/event_model.dart';
import '../../../../shared/utils/store_state.dart';
import '../../../../theme/app_theme.dart';

class CheckButtonWidget extends StatefulWidget {
  final EventModel event;
  final FriendModel friend;
  const CheckButtonWidget({
    Key? key,
    required this.event,
    required this.friend,
  }) : super(key: key);

  @override
  State<CheckButtonWidget> createState() => _CheckButtonWidgetState();
}

class _CheckButtonWidgetState extends State<CheckButtonWidget> {
  late CheckRoundedController checkRoundedController;
  Color get backgroundColor =>
      checkRoundedController.state == StoreState.success
          ? AppTheme.colors.checkBoxBackgroundEnabled
          : AppTheme.colors.checkBoxBackgroundDisabled;

  Color get centerColor => checkRoundedController.state == StoreState.success
      ? AppTheme.colors.checkBoxEnabled
      : AppTheme.colors.checkBoxDisabled;
  @override
  void initState() {
    checkRoundedController = CheckRoundedController(
      repository: FirebaseRepository(),
      event: widget.event,
    );
    if (widget.friend.isPaid) {
      checkRoundedController.state = StoreState.success;
    } else {
      checkRoundedController.state = StoreState.initial;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => InkWell(
        onTap: () {
          checkRoundedController.update(widget.friend);
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: backgroundColor,
          ),
          child: Center(
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: centerColor,
              ),
              child: Center(
                child: checkRoundedController.state == StoreState.success
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: AppTheme.colors.checkBoxBorder,
                                width: 1.5,
                              ),
                            )),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
