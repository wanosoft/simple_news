import 'package:flutter/material.dart';

class SimpleNewsTheme {
  SimpleNewsTheme._();

  static const montserrat = 'Montserrat';
  static const youngSerif = 'Young Serif';

  static const accentTextStyle = TextStyle(fontFamily: youngSerif);
  static const primaryTextStyle = TextStyle(fontFamily: montserrat);

  static const textTheme = TextTheme(
    displayLarge: accentTextStyle,
    displayMedium: accentTextStyle,
    displaySmall: accentTextStyle,
    headlineLarge: primaryTextStyle,
    headlineMedium: primaryTextStyle,
    headlineSmall: primaryTextStyle,
    titleLarge: accentTextStyle,
    titleMedium: accentTextStyle,
    titleSmall: accentTextStyle,
    bodyLarge: primaryTextStyle,
    bodyMedium: primaryTextStyle,
    bodySmall: primaryTextStyle,
  );
}
