import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class SignupLoginButton extends StatelessWidget {
  const SignupLoginButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.backgroundColor,
    this.side,
  });

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
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 108),
    ),
    child:  Text(text, style: AppTextStyles.continueTxtStyle),
  );
}
