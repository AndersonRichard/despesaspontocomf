import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    primaryColor: AppColors.darkBlue,
    scaffoldBackgroundColor: AppColors.darkBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.mediumText18.copyWith(color: Colors.white),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.bigText,
      headlineMedium: AppTextStyles.mediumText,
      bodyMedium: AppTextStyles.mediumText18,
      bodySmall: AppTextStyles.smallText,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.grayishBlue,
    ),
  );
}