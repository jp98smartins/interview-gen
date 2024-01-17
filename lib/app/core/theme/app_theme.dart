import 'package:flutter/material.dart';
import 'package:marvel/app/core/theme/app_colors.dart';

/// This class represents all the themes that we need to develop the app.
sealed class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: AppColors.lightScheme,
    useMaterial3: true,
  );
}
