// lib/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.light,
    surface: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.loraTextTheme().apply(
    bodyColor: Colors.black87,
    displayColor: Colors.black87,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.dark,
    surface: Color(0xFF1A1A1A),
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: GoogleFonts.loraTextTheme().apply(
    bodyColor: Colors.white70,
    displayColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
  ),
);
