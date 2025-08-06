import 'package:flutter/material.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => TextButton(
    onPressed: onPressed,
    style: const ButtonStyle(alignment: Alignment.centerRight),
    child: Text(
      textAlign: TextAlign.end,
      context.locale.forgotPassword,
      style: AppTextStyles.forgotPasswordTxt.copyWith(
        color: context.appColors.permanentBlack50,
      ),
    ),
  );
}
