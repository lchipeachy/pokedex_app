import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorSed = Color(0XFF000029);
const scaffoldBackgroundColor = Colors.white;

class AppTheme {
  ThemeData getTheme() => ThemeData(
    //* Ajustes Generales
    useMaterial3: true,
    colorSchemeSeed: colorSed,
    scaffoldBackgroundColor: scaffoldBackgroundColor,

    //* Textos
    textTheme: TextTheme(
      titleLarge: GoogleFonts.nunito().copyWith(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.nunito().copyWith(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.nunito().copyWith(
        fontSize: 20,
      ),
      bodyMedium: GoogleFonts.nunito().copyWith(
        fontSize: 14,
      ),
    ),
  );
}