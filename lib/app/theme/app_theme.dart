import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static final light = _build(Brightness.light);
  static final dark = _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    final background =  AppColors.darkBackground;
    final colors =
        ColorScheme.fromSeed(
          seedColor: dark ? AppColors.darkPrimary : AppColors.lightPrimary,
          brightness: brightness,
        ).copyWith(
          primary: dark ? AppColors.darkPrimary : AppColors.lightPrimary,
          onPrimary: AppColors.darkOnSurface,
          secondary: dark ? AppColors.darkSecondary : AppColors.lightSecondary,
          onSecondary: AppColors.lightOnSurface,
          surface: dark ? AppColors.darkSurface : AppColors.lightSurface,
          onSurface: dark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
        );
    final base = ThemeData(useMaterial3: true, colorScheme: colors);
    final text = AppTypography.textTheme(base.textTheme);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSpacing.small),
    );
    final buttonStyle = ButtonStyle(
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: AppSpacing.large,
          vertical: AppSpacing.medium,
        ),
      ),
      shape: WidgetStatePropertyAll(shape),
    );
    return base.copyWith(
      scaffoldBackgroundColor: background,
      textTheme: text,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: colors.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: text.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        shape: shape,
        margin: const EdgeInsets.all(AppSpacing.small),
      ),
      filledButtonTheme: FilledButtonThemeData(style: buttonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: buttonStyle.copyWith(elevation: const WidgetStatePropertyAll(0)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
      textButtonTheme: TextButtonThemeData(style: buttonStyle),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        contentPadding: const EdgeInsets.all(AppSpacing.medium),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.surface,
        indicatorColor: colors.secondaryContainer,
        elevation: 0,
        labelTextStyle: WidgetStatePropertyAll(text.labelMedium),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? colors.onSecondaryContainer
                : colors.onSurfaceVariant,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colors.outlineVariant,
        thickness: 1,
        space: AppSpacing.medium,
      ),
    );
  }
}
