import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData light({Color color = const Color(0xFF039D55)}) => ThemeData(
  fontFamily: 'Roboto',
  primaryColor: color,
  secondaryHeaderColor: const Color(0xFF1ED7AA),
  disabledColor: const Color(0xFFBABFC4),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: color),
  ),
  colorScheme: ColorScheme.light(primary: color, secondary: color)
      .copyWith(surface: const Color(0xFFF3F3F3))
      .copyWith(error: const Color(0xFFE84D4F)),

  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
  ),
);
