import 'package:flutter/material.dart';
import 'package:split_it/presentation/controllers/create_split_controller.dart';
import 'package:split_it/shared/utils/formatters.dart';

import '../../../theme/app_theme.dart';

//TODO: colocar modificações tema no apptheme
class CreateSplitSuccessPage extends StatelessWidget {
  final CreateSplitController createSplitController;

  const CreateSplitSuccessPage({
    Key? key,
    required this.createSplitController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0, 1],
          transform: GradientRotation(2.35619),
          colors: [
            Color(0xFF40B38C),
            Color(0xFF45CC93),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/circled_money.png',
                  width: 240,
                  height: 240,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            //TODO: refatorar. Teste de utilização do copyWith pra modificar um tema.
            Text(
              '${createSplitController.event.friendsList.length} pessoas',
              style: AppTheme.textStyles.button
                  .copyWith(color: AppTheme.colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${createSplitController.event.splitValue.reais()}',
              style: AppTheme.textStyles.title
                  .copyWith(color: AppTheme.colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'para cada um',
              style: AppTheme.textStyles.button
                  .copyWith(color: AppTheme.colors.white),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: createSplitController.event.friendsList
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(e.photoURL),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0, 1],
                transform: GradientRotation(2.35619),
                colors: [
                  Color(0xFF40B38C),
                  Color(0xFF45CC93),
                ],
              ),
            ),
            height: 76,
            child: Center(
              child: Text(
                'OKAY :D',
                style: AppTheme.textStyles.stepperNextButton
                    .copyWith(color: AppTheme.colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
