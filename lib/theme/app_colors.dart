import 'package:flutter/material.dart';

abstract class AppColors {
  Color get white;
  Color get background;
  Color get title;
  Color get button;
  Color get border;
  Color get addButton;
  Color get error;
  Color get eventTileTitle;
  Color get eventTileSubtitle;
  Color get eventTileMoney;
  Color get eventTilePeople;
  Color get stepperIndicatorPrimary;
  Color get stepperIndicatorSecondary;
  Color get backButton;
  Color get divider;
  Color get dividerDisabled;
  Color get stepperNextButton;
  Color get stepperNextButtonRegular;
  Color get stepperNextButtonDisabled;
  Color get iconAdd;
  Color get stepperTitle;
  Color get stepperSubtitle;
  Color get textField;
  Color get hintTextField;
  Color get inputBorder;
  Color get success;
  Color get personTileTitleSelected;
  Color get checkBoxBackgroundDisabled;
  Color get checkBoxBackgroundEnabled;
  Color get checkBoxDisabled;
  Color get checkBoxEnabled;
  Color get checkBoxBorder;
  Color get eventDetailPersonTileTitle;
  Color get eventDetailPersonTileSubtitlePaid;
  Color get eventDetailPersonTileSubtitleUnpaid;
  Color get eventDetailDivider;
}

class AppColorsDefault implements AppColors {
  @override
  Color get white => Color(0xFFFFFFFF);

  @override
  Color get background => Color(0xFF40B38C);

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

  @override
  Color get eventTileMoney => Color(0xFF666666);

  @override
  Color get eventTilePeople => Color(0xFFA4B2AE);

  @override
  Color get eventTileSubtitle => Color(0xFF666666);

  @override
  Color get eventTileTitle => Color(0xFF455250);

  @override
  Color get stepperIndicatorPrimary => Color(0xFF3CAB82);

  @override
  Color get stepperIndicatorSecondary => Color(0xFF666666);

  @override
  Color get backButton => Color(0xFF666666);

  @override
  Color get divider => Color(0xFF666666);

  @override
  Color get dividerDisabled => Color(0xFF666666).withOpacity(0.2);

  @override
  Color get stepperNextButton => Color(0xFF455250);

  @override
  Color get stepperNextButtonRegular => Color(0xFF40B28C);
  @override
  Color get iconAdd => Color(0xFF40B28C);

  @override
  Color get stepperSubtitle => Color(0xFF455250);

  @override
  Color get stepperTitle => Color(0xFF455250);

  @override
  Color get hintTextField => Color(0xFF666666);

  @override
  Color get textField => Color(0xFF455250);

  @override
  Color get inputBorder => Color(0xFF455250);

  @override
  Color get stepperNextButtonDisabled => Color(0xFF666666).withOpacity(0.2);

  @override
  Color get success => Color(0xFF40B28C);

  @override
  Color get personTileTitleSelected => Color(0xFF455250);

  @override
  Color get checkBoxEnabled => Color(0xFF40B38C);

  @override
  Color get checkBoxBackgroundEnabled => Color(0xFF40B38C).withOpacity(0.16);

  @override
  Color get checkBoxDisabled => Color(0xFFFFFFFF);

  @override
  Color get checkBoxBackgroundDisabled => Color(0xFF455250).withOpacity(0.08);

  @override
  Color get checkBoxBorder => Color(0xFFC0CCC9);

  @override
  Color get eventDetailPersonTileTitle => Color(0xFF666666);

  @override
  Color get eventDetailPersonTileSubtitlePaid => Color(0xFF40B28C);

  @override
  Color get eventDetailPersonTileSubtitleUnpaid => Color(0xFFE83F5B);

  @override
  Color get eventDetailDivider => Color(0xFF455250).withOpacity(0.08);
}
