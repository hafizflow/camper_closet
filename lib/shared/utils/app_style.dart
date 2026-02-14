import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle h1({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.sora(
      color: color ?? Colors.white,
      fontSize: 24.sp,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle h2({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.sora(
      color: color ?? Colors.white,
      fontSize: 20.sp,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle h3({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? fontSize,
  }) {
    return GoogleFonts.sora(
      color: color ?? Colors.white,
      fontSize: fontSize ?? 18.sp,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle h4({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.sora(
      fontSize: 16.sp,
      color: color ?? Colors.white,
      height: height,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle h5({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.sora(
      fontSize: 14.sp,
      color: color ?? Colors.white,
      height: height,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle h6({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.sora(
      fontSize: 12.sp,
      color: color ?? Colors.white,
      height: height,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle customSize({
    Color? color,
    double? fontSize,
    String? family,
    double? letterSpacing,
    double? height,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.sora(
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.white,
      fontSize: fontSize,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static BoxShadow boxShadow = BoxShadow(
    blurRadius: 4,
    offset: const Offset(0, 0),
    color: Colors.black.withValues(alpha: 0.02),
    spreadRadius: 0,
  );
}
