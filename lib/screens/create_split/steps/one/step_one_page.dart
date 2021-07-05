import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepOnePage extends StatefulWidget {
  final Function(String value)? onChange;
  StepOnePage({Key? key, required this.onChange}) : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
              text: 'Qual o nome',
              style: AppTheme.textStyles.stepperTitle,
              children: [
                TextSpan(
                  text: '\ndo evento?',
                  style: AppTheme.textStyles.stepperSubtitle,
                )
              ]),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 64,
            right: 64,
            top: 40,
          ),
          child: TextField(
            onChanged: widget.onChange,
            textAlign: TextAlign.center,
            style: AppTheme.textStyles.textField,
            cursorColor: AppTheme.colors.background,
            decoration: InputDecoration(
              hintText: 'Ex: Churrasco',
              hintStyle: AppTheme.textStyles.hintTextField,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppTheme.colors.inputBorder.withOpacity(0.2))),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppTheme.colors.inputBorder.withOpacity(0.2))),
            ),
          ),
        ),
      ],
    );
  }
}
