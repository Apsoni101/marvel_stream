import 'package:flutter/material.dart';

abstract class AppThemeColors {
  Color get black;

  Color get black50;

  Color get white;

  Color get white50;

  Color get red;

  Color get lightGrey;

  Color get grey;

  Color get amber;

  Color get baseColor;

  Color get highlightColor;

  Color get permanentBlack => Colors.black;

  Color get permanentBlack50 => const Color(0x80000000);

  Color get permanentWhite => Colors.white;

  Color get success => const Color(0xFF28A745);

  Color get warning => const Color(0xFFFFC107);

  Color get error => const Color(0xFFDC3545);

  Color get info => const Color(0xFF17A2B8);

  Color get disabled => const Color(0xFFBDBDBD);

  Color get border => const Color(0xFFCCCCCC);

  Color get shadow => const Color(0x40000000);

  Color get transparent => Colors.transparent;
}

class AppColorsDark extends AppThemeColors {
  @override
  Color get black => Colors.black;

  @override
  Color get black50 => const Color(0x80000000);

  @override
  Color get white => Colors.white;

  @override
  Color get white50 => Colors.white54;

  @override
  Color get red => const Color(0xFFED1B24);

  @override
  Color get lightGrey => const Color(0xB3FFFFFF);

  @override
  Color get grey => Colors.grey;

  @override
  Color get amber => Colors.amber;

  @override
  Color get baseColor => const Color(0xFF2C2C2C);

  @override
  Color get highlightColor => const Color(0xFF3D3D3D);
}

class AppColorsLight extends AppThemeColors {
  @override
  Color get black => Colors.white;

  @override
  Color get black50 => const Color(0x80FFFFFF);

  @override
  Color get white => Colors.black;

  @override
  Color get white50 => Colors.black54;

  @override
  Color get red => const Color(0xFFED1B24);

  @override
  Color get lightGrey => const Color(0xB3000000);

  @override
  Color get grey => const Color(0xFF424242);

  @override
  Color get amber => Colors.blue;

  @override
  Color get baseColor => const Color(0xFFEAEAEA);

  @override
  Color get highlightColor => const Color(0xFFF5F5F5);
}
