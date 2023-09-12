import 'package:flutter/material.dart';

class ThemeStyle {
  static final darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      backgroundColor: const Color(0xFF000000),
      cardColor: const Color.fromRGBO(158, 158, 157, 1),
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(color: Color(0xFF000000)),
      scaffoldBackgroundColor: Color.fromRGBO(20, 21, 23, 1),
      primaryTextTheme:
          const TextTheme(headline6: TextStyle(color: Colors.white)),
      unselectedWidgetColor: Colors.yellow);
  static final lightTheme = ThemeData(
      useMaterial3: true,
  );
}
