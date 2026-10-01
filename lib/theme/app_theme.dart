import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ==========================================================
  // BRAND COLOR
  // ==========================================================

  // Warna utama aplikasi
  static const Color primary = Color(0xFF147DB5);

  // Biru lebih gelap untuk tombol / emphasis
  static const Color primaryDark = Color(0xFF0D5F8C);

  // Background biru muda
  static const Color primarySoft = Color(0xFFE8F5FB);

  // ==========================================================
  // ACCENT COLORS
  // ==========================================================

  static const Color yellow = Color(0xFFFDB71A);

  static const Color orange = Color(0xFFFF8A3D);

  static const Color leaf = Color(0xFF07985E);

  static const Color red = Color(0xFFED1C24);

  static const Color purple = Color(0xFF7656D6);

  // ==========================================================
  // BACKGROUND
  // ==========================================================

  static const Color background = Color(0xFFF7F9FC);

  static const Color surface = Colors.white;

  // ==========================================================
  // TEXT COLOR
  // ==========================================================

  static const Color textPrimary = Color(0xFF1F2937);

  static const Color textSecondary = Color(0xFF6B7280);

  static const Color textLight = Color(0xFF9CA3AF);

  // ==========================================================
  // DISPLAY / HEADING
  // ==========================================================

  static TextStyle display({
    double fontSize = 22,
    FontWeight fontWeight = FontWeight.w700,
    Color color = textPrimary,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
  );
}

  // ==========================================================
  // TITLE
  // ==========================================================

  static TextStyle title({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    Color color = textPrimary,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // ==========================================================
  // BODY
  // ==========================================================

  static TextStyle body({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = textPrimary,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: 1.4,
    );
  }

  // ==========================================================
  // CAPTION
  // ==========================================================

  static TextStyle caption({
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
    Color color = textSecondary,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // ==========================================================
  // PRICE
  // ==========================================================

  static TextStyle price({
    double fontSize = 15,
    Color color = primary,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      color: color,
    );
  }

  // ==========================================================
  // BUTTON
  // ==========================================================

  static TextStyle button({
    double fontSize = 13,
    Color color = Colors.white,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  // ==========================================================
  // MAIN THEME
  // ==========================================================

  static ThemeData get theme {
    final baseTextTheme = GoogleFonts.poppinsTextTheme();

    final base = ThemeData(
      useMaterial3: true,

      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        surface: surface,
      ),

      scaffoldBackgroundColor: background,

      textTheme: baseTextTheme.apply(
        bodyColor: textPrimary,
        displayColor: textPrimary,
      ),
    );

    return base.copyWith(
      // ========================================================
      // APP BAR
      // ========================================================

      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,

        titleTextStyle: display(
          fontSize: 21,
          fontWeight: FontWeight.w700,
        ),
      ),

      // ========================================================
      // BUTTON
      // ========================================================

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,

          minimumSize: const Size.fromHeight(54),

          textStyle: button(),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          elevation: 0,
        ),
      ),

      // ========================================================
      // INPUT / SEARCH
      // ========================================================

      inputDecorationTheme: InputDecorationTheme(
        filled: true,

        fillColor: Colors.white,

        labelStyle: body(
          fontSize: 13,
          color: textSecondary,
        ),

        hintStyle: body(
          fontSize: 13,
          color: textLight,
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: primary,
            width: 1.6,
          ),
        ),
      ),

      // ========================================================
      // BOTTOM NAVIGATION
      // ========================================================

      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(
        backgroundColor: Colors.white,

        selectedItemColor: primary,

        unselectedItemColor: textLight,

        type: BottomNavigationBarType.fixed,

        elevation: 0,

        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),

        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

// ==========================================================
// FORMAT RUPIAH
// ==========================================================

String formatRupiah(double price) {
  final str = price.toStringAsFixed(0);
  final buffer = StringBuffer();

  for (int i = 0; i < str.length; i++) {
    final posFormed = str.length - i;

    buffer.write(str[i]);

    if (posFormed > 1 && posFormed % 3 == 1) {
      buffer.write('.');
    }
  }

  return 'Rp$buffer';
}