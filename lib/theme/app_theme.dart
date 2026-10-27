import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colores principales
  static const Color background = Color(0xFF0B0B0D);
  static const Color surface = Color(0xFF17171A);
  static const Color secondarySurface = Color(0xFF222225);

  static const Color primaryText = Color(0xFFF5F5F5);
  static const Color secondaryText = Color(0xFF99999F);
  static const Color accent = Color(0xFFE50914);

  // Tema oscuro global de GymFlow
  static ThemeData get darkTheme {
    final baseTheme = ThemeData.dark();

    final textTheme = ThemeData.dark().textTheme
        .apply(
          fontFamily: GoogleFonts.inter().fontFamily,
          bodyColor: primaryText,
          displayColor: primaryText,
        )
        .copyWith(
          headlineLarge: GoogleFonts.inter(
            color: primaryText,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.inter(
            color: primaryText,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.inter(
            color: primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: GoogleFonts.inter(color: primaryText, fontSize: 16),
          bodyMedium: GoogleFonts.inter(color: secondaryText, fontSize: 14),
        );

    return baseTheme.copyWith(
      scaffoldBackgroundColor: background,

      colorScheme: const ColorScheme.dark(
        primary: accent,
        surface: surface,
        onSurface: primaryText,
      ),

      textTheme: textTheme,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        labelStyle: const TextStyle(color: secondaryText),
        hintStyle: const TextStyle(color: secondaryText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: secondarySurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: accent, width: 1.5),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: primaryText,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: primaryText,
        elevation: 0,
      ),
    );
  }
}
