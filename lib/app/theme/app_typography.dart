import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTypography {
  static TextTheme textTheme(TextTheme base) {
    final text = base.copyWith(
      bodyLarge: GoogleFonts.inter(textStyle: base.bodyLarge),
      bodyMedium: GoogleFonts.inter(textStyle: base.bodyMedium),
      bodySmall: GoogleFonts.inter(textStyle: base.bodySmall),
      labelLarge: GoogleFonts.inter(textStyle: base.labelLarge),
      labelMedium: GoogleFonts.inter(textStyle: base.labelMedium),
      labelSmall: GoogleFonts.inter(textStyle: base.labelSmall),
    );
    return text.copyWith(
      displayLarge: GoogleFonts.cinzel(textStyle: text.displayLarge),
      displayMedium: GoogleFonts.cinzel(textStyle: text.displayMedium),
      displaySmall: GoogleFonts.cinzel(textStyle: text.displaySmall),
      headlineLarge: GoogleFonts.cinzel(textStyle: text.headlineLarge),
      headlineMedium: GoogleFonts.cinzel(textStyle: text.headlineMedium),
      headlineSmall: GoogleFonts.cinzel(textStyle: text.headlineSmall),
      titleLarge: GoogleFonts.cinzel(textStyle: text.titleLarge),
      titleMedium: GoogleFonts.cinzel(textStyle: text.titleMedium),
      titleSmall: GoogleFonts.cinzel(textStyle: text.titleSmall),
    );
  }
}
