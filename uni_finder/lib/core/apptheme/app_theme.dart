import 'package:flutter/material.dart';

ThemeData getApplicationTheme({bool isDarkMode = false}) {
  return ThemeData(
    primarySwatch:
        Colors.deepPurple, // Matches ConsultanciesView's primary color
    scaffoldBackgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[200],
    fontFamily: 'Montserrat Regular', // Keeping your font
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18, // Adjusted to match your original theme
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat Bold',
        ),
        backgroundColor:
            Colors.deepPurple, // Matches button color in ConsultanciesView
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              8), // Matches button shape in ConsultanciesView
        ),
        elevation: 2, // Matches button elevation in ConsultanciesView
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true, // Keeping your original setting
      color: Colors.deepPurple, // Matches AppBar in ConsultancyDetailScreen
      elevation: 4,
      titleTextStyle: TextStyle(
        fontSize: 16, // Keeping your original size
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white), // Matches AppBar icons
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepPurple, // Updated to match primary color
      unselectedItemColor: Colors.grey, // Keeping your original grey
      backgroundColor: isDarkMode
          ? Colors.grey[800]
          : Colors.white, // Adjusted for dark mode
    ),
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    cardColor: isDarkMode
        ? Colors.grey[800]
        : Colors.white, // Matches card color in ConsultanciesView
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: isDarkMode
            ? Colors.white
            : Colors.grey.shade600, // Matches text color in ConsultanciesView
        fontSize: 14, // Matches ConsultanciesView text size
      ),
      titleLarge: TextStyle(
        color: isDarkMode
            ? Colors.white
            : Colors.deepPurple
                .shade700, // Matches title color in ConsultanciesView
        fontWeight: FontWeight.bold,
        fontSize: 16, // Matches ConsultanciesView title size
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4, // Matches card elevation in ConsultanciesView
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            16), // Matches card shape in ConsultanciesView
      ),
      color: isDarkMode
          ? Colors.grey[800]
          : Colors.white, // Base color, gradient applied in widget
    ),
  );
}
