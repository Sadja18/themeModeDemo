import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark, // Ensures it uses dark mode
    actionIconTheme: ActionIconThemeData(
      backButtonIconBuilder: (context) => Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      closeButtonIconBuilder: (context) => Icon(
        Icons.close,
        color: Colors.white,
      ),
      drawerButtonIconBuilder: (context) => Icon(
        Icons.menu,
        color: Colors.white,
      ),
      endDrawerButtonIconBuilder: (context) => Icon(
        Icons.menu,
        color: Colors.white,
      ),
    ),

    primaryColorDark: Colors.blueGrey,
    primaryColorLight: Colors.deepPurple,

    primaryColor: Colors.blueGrey, // Primary branding color
    scaffoldBackgroundColor: Colors.black, // Dark background for screens
    canvasColor: Colors.grey[900], // Background color for widgets like Drawer

    // Text Colors
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodySmall: TextStyle(
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
          ), // General text
          bodyMedium: TextStyle(
            color: Colors.white,
          ), // Secondary text
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.black,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.black,
          ),
          headlineSmall: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 51, 58, 158),
      foregroundColor: Colors.white, // Icons & text in AppBar
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      shadowColor: Colors.grey.shade700,
      toolbarTextStyle: TextStyle(
        color: Colors.white,
        backgroundColor: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
    ),

    // Button Styles
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey[800], // Button color
        foregroundColor: Colors.white, // Text color
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blueGrey[700], // Text color
        backgroundColor: Colors.blueGrey.shade100,

      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    // Input Field Styles
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[850], // Dark input field background
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blueGrey,
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.grey[300],
      ), // Label text color
    ),
    // Card Theme
    cardColor: Colors.grey[900], // Background for Card widgets

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: Colors.grey[700],
      thickness: 1,
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}
