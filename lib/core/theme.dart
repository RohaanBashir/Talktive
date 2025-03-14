import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      // Primary color (used for buttons, app bars, etc.)
      primaryColor: Color(0xFF7886C7), // #7886C7
      // Scaffold background color (main background)
      scaffoldBackgroundColor: Color(0xFF2D336B), // #2D336B
      // App bar theme
      appBarTheme: AppBarTheme(
        color: Color(0xFF2D336B), // #2D336B
        titleTextStyle: GoogleFonts.akayaKanadaka(
          color: Color(0xFFFFFFFF), // White for better contrast
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Text theme
      textTheme: TextTheme(
        titleSmall: GoogleFonts.akayaKanadaka(
          color: Color(0xFFFFFFFF), // White for better contrast
          fontSize: 10,
        ),
        titleMedium: GoogleFonts.akayaKanadaka(
          color: Color(0xFFFFFFFF), // White for better contrast
          fontSize: 15,
        ),
        titleLarge: GoogleFonts.akayaKanadaka(
          color: Color(0xFFFFFFFF), // White for better contrast
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: GoogleFonts.akayaKanadaka(
          color: Color(0xFFA9B5DF), // #A9B5DF for secondary text
          fontSize: 15,
        ),
        bodyMedium: GoogleFonts.akayaKanadaka(
          color: Color(0xFFA9B5DF), // #A9B5DF for secondary text
          fontSize: 18,
        ),
        bodyLarge: GoogleFonts.akayaKanadaka(
          color: Color(0xFFA9B5DF), // #A9B5DF for secondary text
          fontSize: 20,
        ),
      ),
      // Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF7886C7), // #7886C7 for buttons
          foregroundColor: Color(0xFFFFFFFF), // White text on buttons
          textStyle: GoogleFonts.akayaKanadaka(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Color scheme for the dark theme
      colorScheme: ColorScheme.dark(
        primary: Color(0xFF7886C7), // #7886C7
        secondary: Color(0xFFA9B5DF), // #A9B5DF
        surface: Color(0xFF2D336B), // #2D336B
        background: Color(0xFF2D336B), // #2D336B
        onPrimary: Color(0xFFFFFFFF), // White text on primary
        onSecondary: Color(0xFFFFFFFF), // White text on secondary
        onSurface: Color(0xFFFFFFFF), // White text on surface
        onBackground: Color(0xFFFFFFFF), // White text on background
      ),
    );
  }
}