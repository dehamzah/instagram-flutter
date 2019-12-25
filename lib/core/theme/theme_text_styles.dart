import 'package:flutter/material.dart';
import 'package:instagram_flutter/core/theme/theme_colors.dart';

class ThemeTextStyles {
  static TextStyle h1({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 22,
      color: isDark ? ThemeColors.white : ThemeColors.black1,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle h2({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 20,
      color: isDark ? ThemeColors.white : ThemeColors.black1,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle h3({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 18,
      color: isDark ? ThemeColors.white : ThemeColors.black1,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle h4({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 16,
      color: isDark ? ThemeColors.white : ThemeColors.black1,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle h5({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 14,
      color: isDark ? ThemeColors.white : ThemeColors.black1,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle h6({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 12,
      color: isDark ? ThemeColors.white : ThemeColors.black1,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle body1({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 14,
      color: isDark ? ThemeColors.white : ThemeColors.black1,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle body2({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 14,
      color: isDark ? ThemeColors.white.withOpacity(0.7) : ThemeColors.black2,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle caption1({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 12,
      color: isDark ? ThemeColors.white : ThemeColors.black1,
    );
  }

  static TextStyle caption2({
    bool isDark = false,
  }) {
    return TextStyle(
      fontSize: 10,
      color: isDark ? ThemeColors.white : ThemeColors.black1,
    );
  }
}
