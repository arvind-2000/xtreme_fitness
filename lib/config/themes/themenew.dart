import 'package:flutter/material.dart';
// primary:Color.fromARGB(255, 219, 215, 215)
final ThemeData lightThemes = ThemeData(

  colorScheme:facebookColorScheme,

  // scaffoldBackgroundColor: Color.fromARGB(255, 24, 23, 23),
  scaffoldBackgroundColor: const Color.fromARGB(255, 209, 208, 206),
  fontFamily: "NotoSans",

);


class FacebookColors {
  static const Color facebookBlue = Color(0xFF1877F2);
  static const Color facebookLightBlue = Color(0xFF42A5F5);
  static const Color facebookDarkBlue = Color(0xFF0D47A1);
  static const Color facebookGray = Color(0xFFB0BEC5);
  static const Color facebookWhite = Colors.white;
  static const Color facebookBlack = Colors.black;
}


 ColorScheme facebookColorScheme =  ColorScheme(
  primary: const Color.fromARGB(255, 236, 232, 232),
  primaryContainer: FacebookColors.facebookLightBlue,
  // secondary: FacebookColors.facebookDarkBlue,
    secondary: Colors.red[800]!,
  secondaryContainer: FacebookColors.facebookGray,
  surface: FacebookColors.facebookWhite,
  background: FacebookColors.facebookWhite,
  error: const Color.fromARGB(255, 37, 21, 20), // Define a color for error states
  onPrimary: const Color.fromARGB(255, 24, 23, 23), // Text color on primary color
  onSecondary: const Color.fromARGB(255, 241, 238, 238), // Text color on secondary color
  onSurface: const Color.fromARGB(255, 24, 23, 23), // Text color on surface
  onBackground: const Color.fromARGB(255, 24, 23, 23), // Text color on background
  onError: FacebookColors.facebookWhite, // Text color on error color
  brightness: Brightness.light, // Specify whether this is a light or dark theme
);

// Define a custom ColorScheme for dark theme
final darkColorSchemes = ColorScheme(
  brightness: Brightness.dark,
  // primary: Color.fromARGB(255, 17, 17, 17),
  primary: Color.fromARGB(255, 17, 17, 17), // Primary color
  secondary: Colors.red[800]!, // Secondary color
  surface: Color.fromARGB(255, 24, 24, 24), // Surface color (e.g., cards, dialogs)
 // Background color
  error: Colors.red[800]!, // Error color
  onPrimary: Colors.white, // Color for text and icons on primary color
  onSecondary: Colors.white, // Color for text and icons on secondary color
  onSurface: Colors.white, // Color for text and icons on surface color
  onBackground: Colors.white, // Color for text and icons on background color
  onError: Colors.white, // Color for text and icons on error color
);