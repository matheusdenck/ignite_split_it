import 'package:flutter/material.dart';

abstract class AppColors {
  Color get white;
  Color get backgroundSecondary;
  Color get title;
  Color get button;
  Color get border;
  Color get addButton;
  Color get error;
}

class AppColorsDefault implements AppColors {
  @override
  Color get white => Color(0xFFFFFFFF);
  @override
  Color get backgroundSecondary => Color(0xFF40B38C);
  @override
  Color get title => Color(0xFF40B28C);
  @override
  Color get button => Color(0xFF666666);
  @override
  Color get border => Color(0xFFDCE0E5);
  @override
  Color get addButton => Color(0xFFF5F5F5);
  @override
  Color get error => Color(0xFFE83F5B);
}
