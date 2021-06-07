import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get userName;
  TextStyle get text12;
  TextStyle get text14;
  TextStyle get money;
  TextStyle get moneyRed;
}

class AppTextStyleDefault implements AppTextStyles {
  @override
  TextStyle get button => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.button,
      );

  @override
  TextStyle get title => GoogleFonts.montserrat(
        color: AppTheme.colors.title,
        fontWeight: FontWeight.w700,
        fontSize: 40,
      );

  @override
  TextStyle get userName => GoogleFonts.montserrat(
        color: AppTheme.colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      );

  @override
  TextStyle get text14 => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.button,
      );

  @override
  TextStyle get text12 => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.button,
      );

  @override
  TextStyle get money => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.title,
      );

  @override
  TextStyle get moneyRed => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.error,
      );
}
