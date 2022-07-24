import 'package:flutter/material.dart';

const primaryColor = Color(0xff082659);
const secondaryColor = Color(0xff51eec2);

Color primaryDarkColor = Colors.red.shade900;
const secondaryDarkColor = Colors.black;

final appTheme = ThemeData(
    ////////////////////////
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
    ),
    ////////////////////////
    iconTheme: const IconThemeData(
      color: secondaryColor,
    ),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: primaryColor),
    ///////////////////////
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    ///////////////////////
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: primaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: secondaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ));
///////////////////////////////////////////////////////////////////////////////////////////////////
final appDarkTheme = ThemeData(
    ////////////////////////
    appBarTheme:  AppBarTheme(
      backgroundColor: primaryDarkColor,
      centerTitle: true,
    ),
    ////////////////////////
    iconTheme: const IconThemeData(
      color: secondaryDarkColor,
    ),
    brightness: Brightness.light,
    primaryColor: primaryDarkColor,
    colorScheme:  ColorScheme.light(
      primary: primaryDarkColor,
    ),
    progressIndicatorTheme:
         ProgressIndicatorThemeData(color: primaryDarkColor),
    ///////////////////////
    floatingActionButtonTheme:  FloatingActionButtonThemeData(
      backgroundColor: primaryDarkColor,
      foregroundColor: secondaryDarkColor,
    ),
    ///////////////////////
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle:  TextStyle(color: primaryDarkColor),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: secondaryDarkColor),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide:  BorderSide(color: primaryDarkColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ));
