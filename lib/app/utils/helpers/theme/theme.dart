import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static  ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: myColorScheme,
      elevatedButtonTheme: elevatedButtonThemeData,
      textTheme: textTheme(),


    );
  }

  static TextTheme textTheme() {
    return TextTheme(
      bodyMedium: GoogleFonts.inter(
        color: const Color(0xFF000000),
        height: 19,
      ),
      titleLarge: GoogleFonts.inter(
        color: const Color(0xFF000000),
      ),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColorValue),
        shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Border radius
          ),
        ),
      ),
    );
  }
}

Color primaryColorValue = const Color(0xff4476f6);
Color secondaryColorValue = const Color(0xffF6C144);

final myColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColorValue,
  secondary: secondaryColorValue,
  onPrimary: primaryColorValue.withOpacity(0.7),
  onSecondary: secondaryColorValue.withOpacity(0.7),
  error: Colors.red,
  onError: Colors.red,
  background: Colors.white,
  onBackground: Colors.white60,
  surface: Colors.white,
  onSurface: Colors.white60,

);


