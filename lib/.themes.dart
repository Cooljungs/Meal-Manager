import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './main.dart';
import '.utilities.dart';

themeHandler(context) {
  return MaterialApp(
    //
    ///! LIGHT THEME ////////////////////////////////////////////////////////////
    //
    theme: ThemeData(
      primaryColor: Colors.white,
      primarySwatch: white,
      accentColor: Colors.black,
      focusColor: Colors.green,
      cardColor: Colors.grey[100],
      canvasColor: Colors.white,
      disabledColor: Colors.green.withOpacity(0.2),
      backgroundColor: Colors.grey[100],
      scaffoldBackgroundColor: Colors.white,
      errorColor: Colors.red,
      hintColor: Colors.grey[400],
      visualDensity: VisualDensity.adaptivePlatformDensity,

      ///* AppBar
      appBarTheme: AppBarTheme(elevation: 0, centerTitle: true),

      ///* Icon-Themes
      iconTheme: IconThemeData(color: Colors.black),
      primaryIconTheme: IconThemeData(color: Colors.black),
      accentIconTheme: IconThemeData(color: Colors.black),

      ///* Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          backgroundColor: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),

      ///* Alert-Dialogs etc.
      dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),

      ///* Text-Themes
      primaryTextTheme:
          GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)
              .copyWith(
        headline6: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      textTheme: GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)
          .copyWith(
        headline1: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
        headline2: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        headline3: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        headline4: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        headline5: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        headline6: GoogleFonts.sourceSansPro(
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

      ///* TextField-Themes etc.
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey[400]),
        labelStyle: TextStyle(color: Colors.grey[400]),
        alignLabelWithHint: true,
        fillColor: Colors.grey[100],
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(16)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(16)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(16)),
      ),
    ),
    //
    //
    //
    //
    ///! DARK THEME /////////////////////////////////////////////////////////////
    //
    darkTheme: ThemeData(
      primaryColor: Colors.black,
      primarySwatch: black,
      accentColor: Colors.white,
      focusColor: Colors.green,
      cardColor: Colors.grey[900],
      canvasColor: Colors.grey[900],
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      /// Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
        ),
      ),

      iconTheme: IconThemeData(color: Colors.black),

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
    home: UserCheck(),
  );
}
