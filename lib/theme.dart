// lib/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom gold colors
const Color goldColor = Color(0xFFFFD700); // Classic gold
const Color lightGold = Color(0xFFFFF0A5); // Lighter gold
const Color darkGold = Color(0xFFCCAC00); // Darker gold

// Light Theme
final lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.amber,
  colorScheme: ColorScheme.light(
    primary: goldColor,
    secondary: lightGold,
    surface: Colors.white,
    background: Colors.grey[50]!,
    error: Colors.red[400]!,
  ),
  scaffoldBackgroundColor: Colors.white,

  textTheme: GoogleFonts.loraTextTheme().apply(
    bodyColor: Colors.black87,
    displayColor: Colors.black87,
  ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: goldColor,
    foregroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: GoogleFonts.lora(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  // Button Themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: goldColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),

  // Text Button Theme - Darker color for better contrast in light mode
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey;
        }
        return const Color(0xFF8B6914); // Darker gold/brown for better contrast
      }),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF8B6914), // Darker gold for contrast
      side: const BorderSide(color: Color(0xFF8B6914)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF8B6914)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF8B6914), width: 2),
    ),
    labelStyle: const TextStyle(color: Color(0xFF8B6914)),
  ),

  // Floating Action Button Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: goldColor,
    foregroundColor: Colors.white,
  ),

  // Card Theme
  cardTheme: CardThemeData(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  // Bottom Navigation Bar Theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: goldColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    elevation: 8,
  ),

  // Tab Bar Theme
  tabBarTheme: const TabBarThemeData(
    labelColor: goldColor,
    unselectedLabelColor: Colors.grey,
    indicatorColor: goldColor,
  ),

  // Progress Indicator Theme
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: goldColor,
  ),

  // Switch Theme
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return goldColor;
      }
      return Colors.grey;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return goldColor.withOpacity(0.5);
      }
      return Colors.grey.withOpacity(0.5);
    }),
  ),

  // Checkbox Theme
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return goldColor;
      }
      return Colors.transparent;
    }),
    side: const BorderSide(color: Color(0xFF8B6914)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),

  // Radio Theme
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return goldColor;
      }
      return Colors.grey;
    }),
  ),

  // Slider Theme
  sliderTheme: SliderThemeData(
    activeTrackColor: goldColor,
    inactiveTrackColor: goldColor.withOpacity(0.3),
    thumbColor: goldColor,
    overlayColor: goldColor.withOpacity(0.2),
    valueIndicatorColor: goldColor,
  ),

  // Icon Theme - Use darker gold for icons in light mode
  iconTheme: const IconThemeData(
    color: Color(0xFF8B6914),
  ),
);

// Dark Theme
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.amber,
  colorScheme: ColorScheme.dark(
    primary: goldColor,
    secondary: lightGold,
    surface: const Color(0xFF1A1A1A),
    background: const Color(0xFF121212),
    error: Colors.red[400]!,
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),

  textTheme: GoogleFonts.loraTextTheme().apply(
    bodyColor: Colors.white70,
    displayColor: Colors.white,
  ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: const Color(0xFF1A1A1A),
    foregroundColor: goldColor,
    iconTheme: IconThemeData(color: goldColor),
    titleTextStyle: GoogleFonts.lora(
      color: goldColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),

  // Button Themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: goldColor,
      foregroundColor: const Color(0xFF121212),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),

  // Text Button Theme - Brighter gold for dark mode
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey[600];
        }
        return goldColor; // Bright gold for dark mode
      }),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: goldColor, // Bright gold for dark mode
      side: const BorderSide(color: goldColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: goldColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: goldColor, width: 2),
    ),
    labelStyle: const TextStyle(color: goldColor),
  ),

  // Floating Action Button Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: goldColor,
    foregroundColor: Color(0xFF121212),
  ),

  // Card Theme
  cardTheme: CardThemeData(
    elevation: 2,
    color: const Color(0xFF1A1A1A),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  // Bottom Navigation Bar Theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: goldColor,
    unselectedItemColor: Colors.grey[400],
    backgroundColor: const Color(0xFF1A1A1A),
    elevation: 8,
  ),

  // Tab Bar Theme
  tabBarTheme: const TabBarThemeData(
    labelColor: goldColor,
    unselectedLabelColor: Colors.grey,
    indicatorColor: goldColor,
  ),

  // Progress Indicator Theme
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: goldColor,
  ),

  // Switch Theme
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return goldColor;
      }
      return Colors.grey;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return goldColor.withOpacity(0.5);
      }
      return Colors.grey.withOpacity(0.5);
    }),
  ),

  // Checkbox Theme
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return goldColor;
      }
      return Colors.transparent;
    }),
    side: const BorderSide(color: goldColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),

  // Radio Theme
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return goldColor;
      }
      return Colors.grey;
    }),
  ),

  // Slider Theme
  sliderTheme: SliderThemeData(
    activeTrackColor: goldColor,
    inactiveTrackColor: goldColor.withOpacity(0.3),
    thumbColor: goldColor,
    overlayColor: goldColor.withOpacity(0.2),
    valueIndicatorColor: goldColor,
  ),

  // Icon Theme - Bright gold for dark mode
  iconTheme: IconThemeData(
    color: goldColor,
  ),
);