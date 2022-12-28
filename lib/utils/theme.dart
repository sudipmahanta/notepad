import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: primaryBGColor,
    fontFamily: 'Montserrat',

    //appBar
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0
    ),

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
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat'
        ),
        titleMedium: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            // fontFamily: 'Montserrat'
        ),
        titleSmall: TextStyle(
            fontSize: 12,
            fontFamily: 'Montserrat'
        ),

        // Label
        labelLarge: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          color: Colors.grey,
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
    textButtonTheme: const TextButtonThemeData(

    ),

    // FloatingActionButton
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
        backgroundColor: primaryColor,
        extendedTextStyle: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white
        )
    ),

    // CardTheme
    cardTheme: CardTheme(
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        )
    ),

    // ListTheme
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      )
    ),

    // RadioTheme
    checkboxTheme: const CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded
    ),

    radioTheme: const RadioThemeData(

    )
  );
}