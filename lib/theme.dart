import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final principalColor = const Color(0xFF2762D2);

final lightColorScheme = ColorScheme.fromSeed(seedColor: principalColor );

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: principalColor,
  brightness: Brightness.dark,
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
  primaryColor: const Color(0xFF2762D2),
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: darkColorScheme.primaryContainer,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(18),
        bottomRight: Radius.circular(18),
      ),
    ),
  ),
  //scaffoldBackgroundColor: Color.fromARGB(255, 239, 248, 255),
  cardTheme: CardTheme().copyWith(
    // color: Colors.white,
    margin: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    titleLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
  ),
  // textTheme: ThemeData().textTheme.copyWith(
  //   titleLarge: TextStyle(
  //       color: Colors.white,
  //       fontWeight: FontWeight.normal,
  //       fontSize: 24
  //   ),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2762D2),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: TextStyle(
      color: darkColorScheme.primary,
    ),
    floatingLabelStyle: TextStyle(
      color: darkColorScheme.primary,
    ),
  ),
);

final lightTheme = ThemeData().copyWith(
  colorScheme: lightColorScheme,
  primaryColor: const Color(0xFF2762D2),
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: const Color(0xFF2762D2),
    foregroundColor: lightColorScheme.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(18),
        bottomRight: Radius.circular(18),
      ),
    ),
  ),
  scaffoldBackgroundColor: Color.fromARGB(255, 239, 248, 255),
  cardTheme: CardTheme().copyWith(
    color: Colors.white,
    margin: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    titleLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
  ),
  // textTheme: ThemeData().textTheme.copyWith(
  //   titleLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2762D2),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        )),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: TextStyle(
      color: lightColorScheme.primary,
    ),
    floatingLabelStyle: TextStyle(
      color: lightColorScheme.primary,
    ),
  ),
);