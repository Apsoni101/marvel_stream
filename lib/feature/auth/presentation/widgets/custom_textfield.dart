import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.labelText,
    required this.controller,
    this.errorText,
    this.obscureText = false,
    super.key,
    this.onChanged,
  });

  final ValueChanged<String>? onChanged;
  final String labelText;
  final String? errorText;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(final BuildContext context) => TextField(
    onChanged: onChanged,
    obscureText: obscureText,
    controller: controller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      filled: true,
      fillColor: context.appColors.permanentWhite,
      labelText: labelText,
      errorText: errorText,
      labelStyle: AppTextStyles.hintTxtStyle.copyWith(
        color: context.appColors.permanentBlack,
      ),
      border: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.appColors.red, width: 2),
      ),
    ),
    style: AppTextStyles.hintTxtStyle.copyWith(
      color: context.appColors.permanentBlack50,
    ),
  );
}
