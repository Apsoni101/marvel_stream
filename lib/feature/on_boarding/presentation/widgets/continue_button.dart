import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      backgroundColor: AppColors.red,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 108),
    ),
    child: const Text(
      AppStrings.continueTxt,
      style: AppTextStyles.continueTxtStyle,
    ),
  );
}
