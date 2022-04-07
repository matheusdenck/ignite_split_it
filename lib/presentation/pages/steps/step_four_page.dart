import 'package:flutter/material.dart';
import 'package:split_it/presentation/controllers/create_split_controller.dart';

import '../../../theme/app_theme.dart';

class StepFourPage extends StatelessWidget {
  final CreateSplitController createSplitController;

  const StepFourPage({
    Key? key,
    required this.createSplitController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
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
            'R\$ ${createSplitController.event.splitValue}',
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
    );
  }
}
