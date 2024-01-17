import 'package:flutter/material.dart';

/// This class represents all the colors that we need to develop the app.
sealed class AppColors {
  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    error: error,
    onError: onError,
    background: background,
    onBackground: onBackground,
    surface: surface,
    onSurface: onSurface,
  );

  static const primary = Color(0xFFDEDEDE);
  static const onPrimary = Color(0xFF101010);
  static const secondary = Color(0xFF3333DE);
  static const onSecondary = Color(0xFFFEFEFE);
  static const error = Color(0xFFFE3333);
  static const onError = Color(0xFFFE3333);
  static const background = Color(0xFFFEFEFE);
  static const onBackground = Color(0xFF101010);
  static const surface = Color(0xFFFEFEFE);
  static const onSurface = Color(0xFF101010);
}
