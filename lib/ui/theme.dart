import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColorLight: const Color(0xFFF1F2F3),
    primaryColor: const Color(0xFF191E38),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffddfb2e),
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),

    cardColor: const Color(0xFFF1F2F3),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: Colors.white,
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    fontFamily: 'Open Sans',
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF191E38),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            fontFamily: 'Open Sans',
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold)),
    textTheme: const TextTheme(
      subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      headline1: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),

      caption: TextStyle(fontSize: 12.0),
      overline: TextStyle(fontSize: 10.0),
      button: TextStyle(fontSize: 16.0, color: Colors.white),
    ),
  );
}
