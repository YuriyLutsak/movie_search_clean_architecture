import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold, // Пример использования FontWeight
        fontFamily: 'Roboto',
        color: Colors.orangeAccent),
    titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold, // Пример использования FontWeight
        fontFamily: 'Roboto',
        color: Colors.white // Имя шрифта как строка
        ),
    titleMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500, // Другой пример FontWeight
        fontFamily: 'Roboto',
        color: Colors.white30),
    titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        color: Colors.white),
  ),
);
