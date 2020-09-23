import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static get light => ThemeData(
        brightness: Brightness.light,
        // backgroundColor: bgColor,
        primaryColorDark: lightPrimaryColorDark,
        primaryColor: lightPrimaryColor,
        accentColor: lightAccentColor,
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
          primary: lightPrimaryColor,
        )),
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              debugLabel: 'blackMountainView headline1',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black54,
              decoration: TextDecoration.none),
          headline2: TextStyle(
              debugLabel: 'blackMountainView headline2',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black54,
              decoration: TextDecoration.none),
          headline3: TextStyle(
              debugLabel: 'blackMountainView headline3',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black54,
              decoration: TextDecoration.none),
          headline4: TextStyle(
              debugLabel: 'blackMountainView headline4',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black54,
              decoration: TextDecoration.none),
          headline5: TextStyle(
              debugLabel: 'blackMountainView headline5',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black87,
              decoration: TextDecoration.none),
          headline6: TextStyle(
              debugLabel: 'blackMountainView headline6',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black87,
              decoration: TextDecoration.none),
          bodyText1: TextStyle(
              debugLabel: 'blackMountainView bodyText1',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black87,
              decoration: TextDecoration.none),
          bodyText2: TextStyle(
              debugLabel: 'blackMountainView bodyText2',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black87,
              decoration: TextDecoration.none),
          subtitle1: TextStyle(
              debugLabel: 'blackMountainView subtitle1',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black87,
              decoration: TextDecoration.none),
          subtitle2: TextStyle(
              debugLabel: 'blackMountainView subtitle2',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black,
              decoration: TextDecoration.none),
          caption: TextStyle(
              debugLabel: 'blackMountainView caption',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black54,
              decoration: TextDecoration.none),
          button: TextStyle(
              debugLabel: 'blackMountainView button',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black87,
              decoration: TextDecoration.none),
          overline: TextStyle(
              debugLabel: 'blackMountainView overline',
              fontFamily: 'Poppins',
              inherit: true,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: bgColor,
          iconTheme: IconThemeData(),
          elevation: 1,
          actionsIconTheme: IconThemeData(),
          textTheme: TextTheme(),
        ),
      );
}
