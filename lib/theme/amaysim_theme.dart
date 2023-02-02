import 'package:flutter/material.dart';

/// Theme, fonts and colors for components
class AmaysimTheme {
  //
  // colors
  //
  static const Color amaysimLightMint = Color.fromRGBO(223, 243, 241, 1);
  static const Color amaysimMint = Color.fromRGBO(202, 241, 239, 1);
  static const Color amaysimDarkMint = Color.fromRGBO(89, 179, 177, 1);

  static const Color amaysimLightYellow = Color.fromRGBO(253, 246, 233, 1);
  static const Color amaysimYellow = Color.fromRGBO(255, 236, 208, 1);

  static const Color amaysimUltraLightOrange = Color.fromRGBO(255, 233, 225, 1);
  static const Color amaysimLightOrange = Color.fromRGBO(255, 213, 192, 1);
  static const Color amaysimOrange = Color.fromRGBO(255, 85, 0, 1);

  static const Color amaysimLightPink = Color.fromRGBO(251, 233, 242, 1);
  static const Color amaysimPink = Color.fromRGBO(250, 230, 240, 1);

  static const Color amaysimUltraLightPurple = Color.fromRGBO(240, 231, 246, 1);
  static const Color amaysimLightPurple = Color.fromRGBO(203, 171, 223, 1);
  static const Color amaysimLightMediumPurple =
      Color.fromRGBO(140, 122, 146, 1);
  static const Color amaysimMediumPurple = Color.fromRGBO(96, 63, 102, 1);
  static const Color amaysimPurple = Color.fromRGBO(119, 0, 171, 1);

  static const Color amaysimLightGrey = Color.fromRGBO(235, 235, 235, 1);
  static const Color amaysimMediumGrey = Color.fromRGBO(182, 182, 182, 1);
  static const Color amaysimGrey = Color.fromRGBO(108, 108, 108, 1);

  static const Color amaysimLightSilver = Color.fromRGBO(238, 236, 240, 1);
  static const Color amaysimSilver = Color.fromRGBO(239, 239, 244, 1);

  static const Color amaysimWhite = Color.fromRGBO(255, 255, 255, 1);
  static const Color amaysimWhite60 = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color amaysimBlack = Color.fromRGBO(48, 48, 48, 1);
  static const Color amaysimLightRed = Color.fromRGBO(221, 39, 39, 1);
  static const Color amaysimRed = Color.fromRGBO(171, 35, 23, 1);
  static const Color amaysimTan = Color.fromRGBO(249, 226, 200, 1);

  static const Color amaysimPeach = Color.fromRGBO(255, 233, 225, 1);
  static const Color amaysimDarkPeach = Color.fromRGBO(255, 210, 196, 1);

  //
  // typography
  //
  static const String fontFamily = 'MarkOffc';
  static const String headlineFontFamily = 'TT-Trailers';

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      headline1: TextStyle(
        fontSize: 120,
        color: AmaysimTheme.amaysimBlack,
        fontWeight: FontWeight.w500,
        fontFamily: headlineFontFamily,
      ),
      headline2: TextStyle(
        fontSize: 72,
        color: AmaysimTheme.amaysimBlack,
        fontFamily: headlineFontFamily,
      ),
      headline3: TextStyle(
        fontSize: 45,
        color: AmaysimTheme.amaysimBlack,
        fontFamily: headlineFontFamily,
      ),
      headline4: TextStyle(
        fontSize: 32,
        color: AmaysimTheme.amaysimBlack,
        fontFamily: headlineFontFamily,
      ),
      headline5: TextStyle(
        fontSize: 28,
        color: AmaysimTheme.amaysimBlack,
        fontFamily: headlineFontFamily,
      ),
      headline6: TextStyle(
        fontSize: 18,
        color: AmaysimTheme.amaysimBlack,
        fontFamily: headlineFontFamily,
      ),
      subtitle1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AmaysimTheme.amaysimPurple,
        letterSpacing: -0.4,
      ),
      subtitle2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AmaysimTheme.amaysimPurple,
        letterSpacing: -0.4,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AmaysimTheme.amaysimBlack,
        letterSpacing: -0.4,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AmaysimTheme.amaysimBlack,
        letterSpacing: -0.4,
      ),
      button: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AmaysimTheme.amaysimBlack,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AmaysimTheme.amaysimBlack,
      ),
      overline: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w100,
        letterSpacing: 1.0,
        color: AmaysimTheme.amaysimBlack,
      ),
    );
  }

  //
  // theme
  //

  /// Return [ThemeData] representing the amaysim theme
  static ThemeData themeData() {
    return ThemeData(
      backgroundColor: amaysimOrange,
      appBarTheme: const AppBarTheme(
        backgroundColor: amaysimOrange,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
        ),
      ),
      fontFamily: fontFamily,
      textTheme: _buildTextTheme(),
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
