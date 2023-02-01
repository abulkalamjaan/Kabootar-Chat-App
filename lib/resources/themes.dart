import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: GoogleFonts.fanwoodText().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.purpleAccent,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
  );
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.purple,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.purple.shade200,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
