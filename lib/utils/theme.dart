import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: primaryBGColor,
    fontFamily: 'Montserrat',

    //icon Theme
    iconTheme: const IconThemeData(
        color: primaryColor
    ),

    //  Text Theme
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500
        ),
        headlineMedium: TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500
        ),
        headlineSmall: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500
        ),

        // BODY TEXT
        bodyLarge: TextStyle(
            fontFamily: 'Montserrat'
        ),
        bodyMedium: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat'
        ),
        bodySmall: TextStyle(
            fontSize: 12,
            fontFamily: 'Montserrat'
        ),

        // TITLE
        titleLarge: TextStyle(
            fontSize: 16,
            fontFamily: 'Montserrat'
        ),
        titleSmall: TextStyle(
            fontSize: 12,
            fontFamily: 'Montserrat'
        ),
        titleMedium: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat'
        ),

        // Label
        labelSmall: TextStyle(
          fontSize: 10,
          color: Colors.grey,
          fontFamily: 'Montserrat'
        )
    ),

    // TextFieldDecoration
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            fontSize: 12.0
        ),
        suffixIconColor: primaryColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: secoundaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: secoundaryColor),
        )
    ),
    // ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
              fontFamily: 'Montserrat',
            ), shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        )),
    ),

    // Todo Ripple effect color of button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          color: secoundTextColor,
          fontFamily: 'Montserrat',
        )
      )
    ),


  );
}