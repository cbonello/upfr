import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData theme(Brightness brightness) {
    if (brightness == Brightness.light) {
      return ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
        primaryColor: Color(0xFFD3534E),
        accentColor: Color(0xFF06D6A9),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF06D6A9),
        ),
      );
    }

    return ThemeData.dark().copyWith(
      primaryColor: Color(0xFFD3534E),
      accentColor: Color(0xFF06D6A9),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF06D6A9),
      ),
    );
  }

  static LinearGradient get widgetGradient => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Color(0xFFD3534E).withRed(0xC0),
          Color(0xFFD3534E),
        ],
      );
}
