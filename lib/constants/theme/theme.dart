import "package:flutter/material.dart";
import "package:quizify/constants/theme/custom_themes.dart";

class MaterialTheme {
  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,

        // our custom theme and styling of the components
        inputDecorationTheme: inputDecorationTheme(colorScheme),
        elevatedButtonTheme: elevatedButtonThemeData(colorScheme),
        outlinedButtonTheme: outlinedButtonThemeData(colorScheme),
        appBarTheme: appBarTheme(colorScheme),
      );

  List<ExtendedColor> get extendedColors => [];

  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff37618e),
      surfaceTint: Color(0xff37618e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd2e4ff),
      onPrimaryContainer: Color(0xff001c37),
      secondary: Color(0xff3f5f90),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd5e3ff),
      onSecondaryContainer: Color(0xff001b3c),
      tertiary: Color(0xff575992),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe1e0ff),
      onTertiaryContainer: Color(0xff13144b),
      error: Color(0xff904a47),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad7),
      onErrorContainer: Color(0xff3b080a),
      background: Color(0xfff8f9ff),
      onBackground: Color(0xff191c20),
      surface: Color(0xffffffff),
      onSurface: Color(0xff171c1f),
      surfaceVariant: Color(0xffdce3e9),
      onSurfaceVariant: Color(0xff41484d),
      outline: Color(0xff71787d),
      outlineVariant: Color(0xffc0c7cd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inverseOnSurface: Color(0xffedf1f5),
      inversePrimary: Color(0xffa1c9fd),
      primaryFixed: Color(0xffd2e4ff),
      onPrimaryFixed: Color(0xff001c37),
      primaryFixedDim: Color(0xffa1c9fd),
      onPrimaryFixedVariant: Color(0xff1b4975),
      secondaryFixed: Color(0xffd5e3ff),
      onSecondaryFixed: Color(0xff001b3c),
      secondaryFixedDim: Color(0xffa8c8ff),
      onSecondaryFixedVariant: Color(0xff254777),
      tertiaryFixed: Color(0xffe1e0ff),
      onTertiaryFixed: Color(0xff13144b),
      tertiaryFixedDim: Color(0xffc0c1ff),
      onTertiaryFixedVariant: Color(0xff3f4178),
      surfaceDim: Color(0xffd6dade),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe5e9ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff154571),
      surfaceTint: Color(0xff37618e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4f77a6),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff204373),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5675a8),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3b3d74),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6d6faa),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff6e2f2d),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffaa5f5c),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff8f9ff),
      onBackground: Color(0xff191c20),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff171c1f),
      surfaceVariant: Color(0xffdce3e9),
      onSurfaceVariant: Color(0xff3d4449),
      outline: Color(0xff596065),
      outlineVariant: Color(0xff747c81),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inverseOnSurface: Color(0xffedf1f5),
      inversePrimary: Color(0xffa1c9fd),
      primaryFixed: Color(0xff4f77a6),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff345e8c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5675a8),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3c5d8e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6d6faa),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff55578f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dade),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe5e9ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff002342),
      surfaceTint: Color(0xff37618e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff154571),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002248),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff204373),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1a1b51),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3b3d74),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff440f10),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff6e2f2d),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfff8f9ff),
      onBackground: Color(0xff191c20),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffdce3e9),
      onSurfaceVariant: Color(0xff1e2529),
      outline: Color(0xff3d4449),
      outlineVariant: Color(0xff3d4449),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3134),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffe2edff),
      primaryFixed: Color(0xff154571),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002e53),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff204373),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff002c5b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3b3d74),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff25265c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dade),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f4f8),
      surfaceContainer: Color(0xffeaeef2),
      surfaceContainerHigh: Color(0xffe5e9ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa1c9fd),
      surfaceTint: Color(0xffa1c9fd),
      onPrimary: Color(0xff003259),
      primaryContainer: Color(0xff1b4975),
      onPrimaryContainer: Color(0xffd2e4ff),
      secondary: Color(0xffa8c8ff),
      onSecondary: Color(0xff05305f),
      secondaryContainer: Color(0xff254777),
      onSecondaryContainer: Color(0xffd5e3ff),
      tertiary: Color(0xffc0c1ff),
      onTertiary: Color(0xff292a60),
      tertiaryContainer: Color(0xff3f4178),
      onTertiaryContainer: Color(0xffe1e0ff),
      error: Color(0xffffb3af),
      onError: Color(0xff571d1c),
      errorContainer: Color(0xff733331),
      onErrorContainer: Color(0xffffdad7),
      background: Color(0xff111418),
      onBackground: Color(0xffe1e2e8),
      surface: Color(0xff0f1417),
      onSurface: Color(0xffdfe3e7),
      surfaceVariant: Color(0xff41484d),
      onSurfaceVariant: Color(0xffc0c7cd),
      outline: Color(0xff8a9297),
      outlineVariant: Color(0xff41484d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inverseOnSurface: Color(0xff2c3134),
      inversePrimary: Color(0xff37618e),
      primaryFixed: Color(0xffd2e4ff),
      onPrimaryFixed: Color(0xff001c37),
      primaryFixedDim: Color(0xffa1c9fd),
      onPrimaryFixedVariant: Color(0xff1b4975),
      secondaryFixed: Color(0xffd5e3ff),
      onSecondaryFixed: Color(0xff001b3c),
      secondaryFixedDim: Color(0xffa8c8ff),
      onSecondaryFixedVariant: Color(0xff254777),
      tertiaryFixed: Color(0xffe1e0ff),
      onTertiaryFixed: Color(0xff13144b),
      tertiaryFixedDim: Color(0xffc0c1ff),
      onTertiaryFixedVariant: Color(0xff3f4178),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa8ceff),
      surfaceTint: Color(0xffa1c9fd),
      onPrimary: Color(0xff00172e),
      primaryContainer: Color(0xff6b93c4),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffafccff),
      onSecondary: Color(0xff001633),
      secondaryContainer: Color(0xff7292c6),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc5c6ff),
      onTertiary: Color(0xff0d0d45),
      tertiaryContainer: Color(0xff8a8bc8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffb9b5),
      onError: Color(0xff330406),
      errorContainer: Color(0xffcb7b76),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111418),
      onBackground: Color(0xffe1e2e8),
      surface: Color(0xff0f1417),
      onSurface: Color(0xfff7fbff),
      surfaceVariant: Color(0xff41484d),
      onSurfaceVariant: Color(0xffc5ccd1),
      outline: Color(0xff9da4a9),
      outlineVariant: Color(0xff7d8489),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inverseOnSurface: Color(0xff262b2e),
      inversePrimary: Color(0xff1d4a76),
      primaryFixed: Color(0xffd2e4ff),
      onPrimaryFixed: Color(0xff001225),
      primaryFixedDim: Color(0xffa1c9fd),
      onPrimaryFixedVariant: Color(0xff003863),
      secondaryFixed: Color(0xffd5e3ff),
      onSecondaryFixed: Color(0xff00112a),
      secondaryFixedDim: Color(0xffa8c8ff),
      onSecondaryFixedVariant: Color(0xff0f3665),
      tertiaryFixed: Color(0xffe1e0ff),
      onTertiaryFixed: Color(0xff070641),
      tertiaryFixedDim: Color(0xffc0c1ff),
      onTertiaryFixedVariant: Color(0xff2e3066),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffafaff),
      surfaceTint: Color(0xffa1c9fd),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa8ceff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffbfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffafccff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffdf9ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc5c6ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffb9b5),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff111418),
      onBackground: Color(0xffe1e2e8),
      surface: Color(0xff0f1417),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff41484d),
      onSurfaceVariant: Color(0xfff8fbff),
      outline: Color(0xffc5ccd1),
      outlineVariant: Color(0xffc5ccd1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe3e7),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff002b4f),
      primaryFixed: Color(0xffd9e8ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa8ceff),
      onPrimaryFixedVariant: Color(0xff00172e),
      secondaryFixed: Color(0xffdce7ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffafccff),
      onSecondaryFixedVariant: Color(0xff001633),
      tertiaryFixed: Color(0xffe6e4ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc5c6ff),
      onTertiaryFixedVariant: Color(0xff0d0d45),
      surfaceDim: Color(0xff0f1417),
      surfaceBright: Color(0xff353a3d),
      surfaceContainerLowest: Color(0xff0a0f12),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff262b2e),
      surfaceContainerHighest: Color(0xff313539),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
