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
