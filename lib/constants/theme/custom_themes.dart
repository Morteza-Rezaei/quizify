import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/border_radius.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';

// our app's custom input decoration theme
InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorScheme.onSurface,
      ),
      borderRadius: BorderRadius.circular(kTextFieldBorderRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorScheme.primary,
      ),
      borderRadius: BorderRadius.circular(kTextFieldBorderRadius),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorScheme.error,
      ),
      borderRadius: BorderRadius.circular(kTextFieldBorderRadius),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorScheme.error,
      ),
      borderRadius: BorderRadius.circular(kTextFieldBorderRadius),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: kHorizontalPadding,
      vertical: kVericalPadding * 0.8,
    ),
  );
}

// our app's custom elevated button theme
ElevatedButtonThemeData elevatedButtonThemeData(ColorScheme colorScheme) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.primary50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kButtonBorderRadius),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding * 2,
        vertical: kVericalPadding * 0.8,
      ),
    ),
  );
}

// our app's custom outlined button theme
OutlinedButtonThemeData outlinedButtonThemeData(ColorScheme colorScheme) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          kButtonBorderRadius,
        ),
      ),
      side: const BorderSide(
        color: AppColors.primary50,
        width: 1,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding * 2,
        vertical: kVericalPadding * 0.8,
      ),
    ),
  );
}

// our app's custom app bar theme
AppBarTheme appBarTheme(ColorScheme colorScheme) {
  return AppBarTheme(
    backgroundColor: colorScheme.surface,
    elevation: 0,
    iconTheme: IconThemeData(
      color: colorScheme.onSurface,
    ),
    centerTitle: true,
  );
}
