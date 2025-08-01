import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class CustomRedBorderButton extends StatelessWidget {
  const CustomRedBorderButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.backgroundColor,
    this.side,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BorderSide? side;
  final String text;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      backgroundColor: backgroundColor ?? AppColors.red,
      side: side,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 14, horizontal: 108),
    ),
    child: Text(text, style: AppTextStyles.continueTxtStyle),
  );
}
