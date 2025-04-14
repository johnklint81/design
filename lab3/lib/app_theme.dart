import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Common spacing
  static const double paddingTiny = 4.0;
  static const double paddingSmall = 8.0;   // Changed this variable to const
  static const double paddingMediumSmall = 12.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingHuge = 32.0;
  static const double paddingHUGE = 48.0;

  static const TextStyle mediumHeading = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle smallText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // App color
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.green,    // Välj något som känns bra
  );
  static TextTheme textTheme = GoogleFonts.nunitoTextTheme();
}
