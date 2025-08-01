import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => TextButton(
    onPressed: onPressed,
    style: const ButtonStyle(alignment: Alignment.centerRight),
    child: const Text(
      textAlign: TextAlign.end,
      AppStrings.forgotPassword,
      style: AppTextStyles.forgotPasswordTxt,
    ),
  );
}
