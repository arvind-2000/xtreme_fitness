
import 'package:flutter/material.dart';
import 'package:xtreme_fitness/config/colors.dart';

final ThemeData darkThemeData = ThemeData(
  colorScheme: customDarkColorScheme,
 
  scaffoldBackgroundColor: const Color.fromARGB(255, 19, 18, 18),

  fontFamily: "NotoSans",
  textTheme:const TextTheme(
    headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineSmall: TextStyle(fontSize: 14.0, color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: const Color.fromARGB(255, 19, 18, 18),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.red, 
    textTheme: ButtonTextTheme.primary,
  ),

  cardTheme: CardTheme(
    color: Colors.grey[850], 
    elevation: 2,
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: const OutlineInputBorder(),
    fillColor: Colors.grey[700],
    filled: true,
  ),
);
