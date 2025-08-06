import 'package:flutter/material.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      backgroundColor: context.appColors.red,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 108),
    ),
    child: Text(
      context.locale.continueTxt,
      style: AppTextStyles.continueTxtStyle.copyWith(
          color: context.appColors.permanentWhite),
    ),
  );
}
