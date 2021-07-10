import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';
import '.colors.dart';

themeHandler(context) {
  return MaterialApp(
    //
    //
    //
    //
    /// LIGHT THEME ////////////////////////////////////////////////////////////
    //
    theme: ThemeData(
      primaryColor: Colors.white,
      primarySwatch: white,
      accentColor: Colors.black,
      scaffoldBackgroundColor: white,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      /// Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
        ),
      ),

      /// text
      primaryTextTheme:
      GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).copyWith(
        headline5: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        headline6: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 48,
          ),
        ),
      ),
      textTheme:
      GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).copyWith(
        headline5: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        headline6: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 48,
          ),
        ),
        bodyText2: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: Colors.black),
        ),
      ),
    ),
    //
    //
    //
    //
    /// DARK THEME /////////////////////////////////////////////////////////////
    //
    darkTheme: ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,

      /// Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),

      /// text
      primaryTextTheme:
      GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).copyWith(
        headline6: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 48,
          ),
        ),
      ),
      textTheme:
      GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).copyWith(
        headline6: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 48,
          ),
        ),
        bodyText2: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
    ),
    //
    //
    //
    /// OTHERS /////////////////////////////////////////////////////////////////
    //
    home: Main(),
  );
}
