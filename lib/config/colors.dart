import 'package:flutter/material.dart';

const Color darkPrimaryColor = Color(0xFF1A1A1A); // Slightly lighter than black
const Color redColor = Color(0xFFE53935); // A good-looking red color
const Color darkBackgroundColor = Color(0xFF121212); // Dark background color
const Color surfaceColor = Color(0xFF424242); // Surface color for cards, dialogs, etc.
const Color onSurfaceColor = Colors.white; // Text and icon color on surfaces

// Create a custom dark color scheme
ColorScheme customDarkColorScheme = const ColorScheme(
  primary: darkPrimaryColor,
  secondary: redColor,
  surface: surfaceColor,
  error: Colors.red, // Example of an error color
  onPrimary: Colors.white, // Text and icons on primary color
  onSecondary: Colors.white, // Text and icons on secondary color
  onSurface: onSurfaceColor, // Text and icons on background color
  onError: Colors.white, // Text and icons on error color
  brightness: Brightness.dark,
);


Color lightBackground = const Color.fromARGB(255, 253, 250, 244); // Example warm white color
Color warmWhite = const Color.fromARGB(255, 223, 217, 215); // Example light warm background color
Color lightSecondaryColor = Colors.red; // Example light secondary color
Color lightSurfaceColor =  const Color(0xFFFFF9F7); // Example light surface color
Color onLightSurfaceColor = Colors.black87; // Example text color on light surface

ColorScheme customLightColorScheme = ColorScheme(
  primary: warmWhite,
  secondary: lightSecondaryColor,
  surface: lightSurfaceColor,
  background: Colors.grey[200], // Example light background color
  error: Colors.red, // Example error color
  onPrimary: Colors.white, // Text and icons on primary color
  onSecondary: Colors.white, // Text and icons on secondary color
  onSurface: onLightSurfaceColor, // Text and icons on light surface color
  onBackground: Colors.black87, // Text and icons on background color
  onError: Colors.white, // Text and icons on error color
  brightness: Brightness.light,
);


  const Color brownishred = Color.fromARGB(255,192,82,87);
  const Color brownishred2 = Color.fromARGB(255,141,64,80);
  const Color brownishred3 = Color.fromARGB(255,103,48,71);
  const Color brownishred4 = Color.fromARGB(255,36,21,54);
