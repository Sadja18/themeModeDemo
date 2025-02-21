import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light, // Ensures it uses dark mode
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
    scaffoldBackgroundColor: Colors.white, // Dark background for screens
    canvasColor: Colors.grey[900], // Background color for widgets like Drawer

    // Text Colors
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodySmall: TextStyle(
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            color: Colors.black,
          ), // General text
          bodyMedium: TextStyle(
            color: Colors.black,
          ), // Secondary text
          titleLarge: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
          headlineMedium: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
          headlineSmall: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
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
      shadowColor: Colors.white12,
      toolbarTextStyle: TextStyle(
        color: Colors.white,
        backgroundColor: Colors.white,
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
        backgroundColor: Colors.lightBlueAccent, // Button color
        foregroundColor: Colors.black, // Text color
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black, // Text color
        backgroundColor: const Color.fromARGB(255, 207, 207, 207),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
      ),
    ),
    // Input Field Styles
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white60, // Dark input field background
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.black,
      ), // Label text color
    ),
    // Card Theme
    cardColor: Colors.white, // Background for Card widgets

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: Colors.black45,
      thickness: 1,
    ),

    // Icon Theme
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );
}
