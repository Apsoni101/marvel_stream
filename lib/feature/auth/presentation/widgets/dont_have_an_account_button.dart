import 'package:flutter/material.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';

class DontHaveAnAccountButton extends StatelessWidget {
  const DontHaveAnAccountButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        context.locale.dontHaveAnAccount,
        style: AppTextStyles.forgotPasswordTxt.copyWith(
          fontSize: 13,
          color: context.appColors.lightGrey,
        ),
      ),
      TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          context.locale.signup,
          style: AppTextStyles.forgotPasswordTxt.copyWith(
            fontSize: 13,
            color: context.appColors.red,
          ),
        ),
      ),
    ],
  );
}
