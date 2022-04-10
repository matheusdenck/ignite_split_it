import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get title;
  TextStyle get button;
  TextStyle get userName;
  TextStyle get infoCardTitle;
  TextStyle get infoCardSubtitle1;
  TextStyle get infoCardSubtitle2;
  TextStyle get eventTileTitle;
  TextStyle get eventTileSubtitle;
  TextStyle get eventTileMoney;
  TextStyle get eventTilePeople;
  TextStyle get stepperIndicatorPrimary;
  TextStyle get stepperIndicatorSecondary;
  TextStyle get stepperNextButton;
  TextStyle get stepperNextButtonRegular;
  TextStyle get stepperNextButtonDisabled;
  TextStyle get appBarEventDetailsTitle;
  TextStyle get stepperTitle;
  TextStyle get stepperSubtitle;
  TextStyle get textField;
  TextStyle get hintTextField;
  TextStyle get personTileTitle;
  TextStyle get personTileTitleSelected;
  TextStyle get eventDetailPersonTileTitle;
  TextStyle get eventDetailPersonTileSubtitlePaid;
  TextStyle get eventDetailPersonTileSubtitleUnpaid;
  TextStyle get eventDetailSubtitle;
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
  TextStyle get infoCardTitle => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.button,
      );

  @override
  TextStyle get infoCardSubtitle1 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.title,
      );

  @override
  TextStyle get infoCardSubtitle2 => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.error,
      );

  @override
  TextStyle get eventTileSubtitle => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTileSubtitle,
      );

  @override
  TextStyle get eventTileTitle => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.eventTileTitle,
      );

  @override
  TextStyle get eventTileMoney => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTileMoney,
      );

  @override
  TextStyle get eventTilePeople => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventTilePeople,
      );
  @override
  TextStyle get stepperIndicatorPrimary => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.stepperIndicatorPrimary,
      );
  @override
  TextStyle get stepperIndicatorSecondary => GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.stepperIndicatorSecondary,
      );

  @override
  TextStyle get stepperNextButton => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextButton,
      );

  @override
  TextStyle get stepperTitle => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.stepperTitle,
      );

  @override
  TextStyle get stepperSubtitle => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.stepperSubtitle,
      );

  @override
  TextStyle get textField => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.textField,
      );

  @override
  TextStyle get hintTextField => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.hintTextField,
      );

  @override
  TextStyle get stepperNextButtonDisabled => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextButtonDisabled,
      );

  @override
  TextStyle get personTileTitle => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.button,
      );

  @override
  TextStyle get personTileTitleSelected => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.personTileTitleSelected,
      );

  @override
  TextStyle get stepperNextButtonRegular => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppTheme.colors.stepperNextButtonRegular,
      );

  @override
  TextStyle get appBarEventDetailsTitle => GoogleFonts.montserrat(
        color: AppTheme.colors.eventTileTitle,
        fontWeight: FontWeight.w700,
        fontSize: 22,
      );

  @override
  TextStyle get eventDetailPersonTileTitle => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppTheme.colors.eventDetailPersonTileTitle,
      );

  @override
  TextStyle get eventDetailPersonTileSubtitlePaid => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.eventDetailPersonTileSubtitlePaid,
      );

  @override
  TextStyle get eventDetailPersonTileSubtitleUnpaid => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.eventDetailPersonTileSubtitleUnpaid,
      );

  @override
  TextStyle get eventDetailSubtitle => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppTheme.colors.eventTileTitle,
      );
}
