import 'package:flutter/material.dart';

final commonTheme = ThemeData(
  
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
  // colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
  primaryColor: Colors.blue[800],
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w900,
      fontSize: 22,
      // fontFamily: FontFace('Verdana', source)
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    )
  ),
  useMaterial3: true,
  // scaffoldBackgroundColor: Colors.blue[800]
);