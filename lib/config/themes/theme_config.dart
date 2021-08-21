import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/main.dart';
import 'package:meal_manager/config/themes/light_theme.dart';
import 'package:meal_manager/config/themes/dark_theme.dart';
import 'package:meal_manager/utils/providers.dart';

class ThemeHandler extends StatelessWidget {
  const ThemeHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(
        context,
        light_primaryColor,
        light_onPrimaryColor,
        Provider.of<ColorProvider>(context)
            .secondaryColor, //light_secondaryColor,
        light_onSecondaryColor,
        light_backgroundColor,
        light_surfaceColor,
        light_hintColor,
        light_borderColor,
        light_errorColor,
      ),
      darkTheme: theme(
        context,
        dark_primaryColor,
        dark_onPrimaryColor,
        Provider.of<ColorProvider>(context)
            .secondaryColor, //dark_secondaryColor,
        dark_onSecondaryColor,
        dark_backgroundColor,
        dark_surfaceColor,
        dark_hintColor,
        dark_borderColor,
        dark_errorColor,
      ),
      home: UserCheck(),
    );
  }

  theme(context, primaryColor, onPrimaryColor, secondaryColor, onSecondaryColor,
      backgroundColor, surfaceColor, hintColor, borderColor, errorColor) {
    //
    return ThemeData(
      primaryColor: primaryColor,
      //primarySwatch: customSwatch(primaryColor.value),
      accentColor: secondaryColor,
      focusColor: secondaryColor,
      cardColor: surfaceColor,
      canvasColor: surfaceColor,
      disabledColor: secondaryColor.withOpacity(0.2),
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      errorColor: errorColor,
      hintColor: hintColor,
      dividerColor: hintColor,
      buttonColor: secondaryColor,
      hoverColor: primaryColor,
      indicatorColor: secondaryColor,
      bottomAppBarColor: primaryColor,
      dialogBackgroundColor: surfaceColor,
      colorScheme: ColorScheme(
        primary: primaryColor,
        primaryVariant: borderColor,
        onPrimary: onPrimaryColor,
        secondary: secondaryColor,
        secondaryVariant: secondaryColor,
        onSecondary: onSecondaryColor,
        surface: surfaceColor,
        onSurface: onPrimaryColor,
        background: backgroundColor,
        onBackground: onPrimaryColor,
        error: errorColor,
        onError: onPrimaryColor,
        brightness: Brightness.light,
      ),

      visualDensity: VisualDensity.adaptivePlatformDensity,

      ///* AppBar
      appBarTheme: AppBarTheme(elevation: 0, centerTitle: true),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(),

      ///* Icon-Themes
      iconTheme: IconThemeData(color: onPrimaryColor, opacity: 1),
      primaryIconTheme: IconThemeData(color: onPrimaryColor, opacity: 1),
      accentIconTheme: IconThemeData(color: onSecondaryColor, opacity: 1),

      ///* Buttons
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          backgroundColor: secondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),

      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? secondaryColor.withOpacity(0.5)
                : borderColor),
        thumbColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? secondaryColor
                : onPrimaryColor),
      ),

      ///* Alert-Dialogs etc.
      dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(
              color: onPrimaryColor, fontWeight: FontWeight.w600, fontSize: 24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),

      ///* Text-Themes
      primaryTextTheme:
          GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)
              .copyWith(
        bodyText1: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: onPrimaryColor),
        ),
        bodyText2: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: onPrimaryColor),
        ),
        headline6: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: onPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      textTheme: GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)
          .copyWith(
        button: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: onPrimaryColor,
            //fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        headline1: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
        ),
        headline2: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: onPrimaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        headline3: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: onPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        headline4: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: onPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        headline5: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: onPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        headline6: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(
            color: onPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 48,
          ),
        ),
        bodyText1: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: onPrimaryColor),
        ),
        bodyText2: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: onPrimaryColor),
        ),
        subtitle1: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: onPrimaryColor),
        ),
        caption: GoogleFonts.sourceSansPro(
          textStyle: TextStyle(color: hintColor),
        ),
      ),

      ///* TextField-Themes etc.
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: secondaryColor,
        selectionColor: hintColor,
        selectionHandleColor: secondaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: hintColor),
        labelStyle: TextStyle(color: borderColor),
        alignLabelWithHint: true,
        fillColor: surfaceColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(16)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
            borderRadius: BorderRadius.circular(16)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorColor),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  customSwatch(color) {
    return MaterialColor(
      color,
      <int, Color>{
        50: Color(color),
        100: Color(color),
        200: Color(color),
        300: Color(color),
        400: Color(color),
        500: Color(color),
        600: Color(color),
        700: Color(color),
        800: Color(color),
        900: Color(color),
      },
    );
  }
}
