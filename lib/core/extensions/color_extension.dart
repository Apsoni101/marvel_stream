import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';


extension AppColorsExtension on BuildContext {
  AppThemeColors get appColors {
    final Brightness brightness = Theme.of(this).brightness;
    if (brightness == Brightness.dark) {
      return AppColorsDark();
    } else {
      return AppColorsLight();
    }
  }
}
