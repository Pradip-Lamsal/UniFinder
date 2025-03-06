import 'package:flutter/material.dart';

// Light Theme Colors (Modernized)
const lightPrimaryColor = Color(0xFF26A69A); // Soft teal
const lightSecondaryColor = Color(0xFFFF6F61); // Warm coral
const lightSurfaceColor = Color(0xFFF7FAFC); // Off-white for surfaces
const lightBackgroundColor = Color(0xFFE6F0FA); // Light greyish-blue background
const lightOnPrimaryColor =
    Color(0xFFFFFFFF); // White for text/icons on primary
const lightOnSecondaryColor =
    Color(0xFFFFFFFF); // White for text/icons on secondary
const lightOnSurfaceColor =
    Color(0xFF1A202C); // Dark grey for text/icons on surface
const lightOnBackgroundColor =
    Color(0xFF4A5568); // Lighter grey for secondary text

// Dark Theme Colors (Reverted to Previous)
const darkPrimaryColor = Color(0xFF7986CB); // Deep purple accent
const darkSecondaryColor = Color(0xFFFF80AB); // Softer pink
const darkSurfaceColor = Color(0xFF1F1F1F); // Dark grey for surfaces
const darkBackgroundColor = Color(0xFF121212); // Darker grey for background
const darkOnPrimaryColor = Color(0xFFFFFFFF); // White for text/icons on primary
const darkOnSecondaryColor =
    Color(0xFFFFFFFF); // White for text/icons on secondary
const darkOnSurfaceColor =
    Color(0xFFE0E0E0); // Light grey for text/icons on surface
const darkOnBackgroundColor =
    Color(0xFF000000); // Slightly darker grey for secondary text

ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightPrimaryColor,
      elevation: 4,
      titleTextStyle: TextStyle(
        color: lightOnPrimaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: lightOnPrimaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightSurfaceColor,
      selectedItemColor: lightPrimaryColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      elevation: 8,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: lightOnSurfaceColor, fontSize: 16),
      bodyMedium: TextStyle(color: lightOnBackgroundColor, fontSize: 14),
      titleLarge: TextStyle(
        color: lightOnSurfaceColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: lightSurfaceColor,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: lightSecondaryColor,
      contentTextStyle: const TextStyle(
        color: lightOnSecondaryColor,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightPrimaryColor,
        foregroundColor: lightOnPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: lightPrimaryColor,
      secondary: lightSecondaryColor,
      surface: lightSurfaceColor,
      onPrimary: lightOnPrimaryColor,
      onSecondary: lightOnSecondaryColor,
      onSurface: lightOnSurfaceColor,
    ).copyWith(brightness: Brightness.light),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkPrimaryColor,
      elevation: 4,
      titleTextStyle: TextStyle(
        color: darkOnPrimaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: darkOnPrimaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkSurfaceColor,
      selectedItemColor: darkPrimaryColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      elevation: 8,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: darkOnSurfaceColor, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white54, fontSize: 14),
      titleLarge: TextStyle(
        color: darkOnSurfaceColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: darkSurfaceColor,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: darkSecondaryColor,
      contentTextStyle: const TextStyle(
        color: darkOnSecondaryColor,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPrimaryColor,
        foregroundColor: darkOnPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      surface: darkSurfaceColor,
      onPrimary: darkOnPrimaryColor,
      onSecondary: darkOnSecondaryColor,
      onSurface: darkOnSurfaceColor,
    ).copyWith(brightness: Brightness.dark),
  );
}
