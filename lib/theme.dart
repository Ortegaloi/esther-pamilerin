// lib/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    brightness: Brightness.light,
    surface: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,

  textTheme: GoogleFonts.loraTextTheme().apply(
    bodyColor: Colors.black87,
    displayColor: Colors.black87,
  ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: GoogleFonts.lora(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  // 🔑 THIS IS THE MISSING PIECE
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white),
    ),
  ),
);





final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.indigo,
    brightness: Brightness.dark,
    surface: const Color(0xFF1A1A1A),
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),

  textTheme: GoogleFonts.loraTextTheme().apply(
    bodyColor: Colors.white70,
    displayColor: Colors.white,
  ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.indigo,
    iconTheme: const IconThemeData(color: Colors.indigo),
    titleTextStyle: GoogleFonts.lora(
      color: Colors.indigo,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  // 🔑 MATCHING BUTTON COLOR
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.indigo),
    ),
  ),
);
