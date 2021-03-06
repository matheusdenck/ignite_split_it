import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputTextWidget extends StatelessWidget {
  final void Function(String) onChange;
  final String hintText;
  final String? initialValue;
  final TextAlign align;
  final EdgeInsets? padding;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  StepInputTextWidget({
    Key? key,
    required this.hintText,
    required this.onChange,
    this.align = TextAlign.center,
    this.padding,
    this.textEditingController,
    this.textInputType = TextInputType.text,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 64, right: 64, top: 40),
      child: TextFormField(
        initialValue: initialValue,
        controller: textEditingController,
        keyboardType: textInputType,
        onChanged: onChange,
        textAlign: align,
        style: AppTheme.textStyles.textField,
        cursorColor: AppTheme.colors.background,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTheme.textStyles.hintTextField,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.colors.inputBorder.withOpacity(0.2))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.colors.inputBorder.withOpacity(0.2))),
        ),
      ),
    );
  }
}
