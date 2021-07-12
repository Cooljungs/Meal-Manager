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
      highlightColor: Colors.green,
      cardColor: Colors.grey[100],
      canvasColor: Colors.white,
      backgroundColor: Colors.grey[100],
      scaffoldBackgroundColor: Colors.white,
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
        headline6: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      textTheme:
          GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).copyWith(
        headline2: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
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
      primarySwatch: black,
      accentColor: Colors.white,
      highlightColor: Colors.green,
      cardColor: Colors.black,
      canvasColor: Colors.black,
      backgroundColor: Colors.grey[900],
      scaffoldBackgroundColor: Colors.grey[900],
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
        headline6: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      textTheme:
          GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).copyWith(
        headline2: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        headline5: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        headline6: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 48,
          ),
        ),
        bodyText1: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: Colors.white),
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
