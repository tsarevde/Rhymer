import 'package:flutter/material.dart';

const primaryColor = Color(0xFFF82810);

final themeData = ThemeData(
  dividerTheme: DividerThemeData(
    color: Colors.grey.withOpacity(0.1),
  ),
  primaryColor: primaryColor,
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFEFF1F3),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
);
