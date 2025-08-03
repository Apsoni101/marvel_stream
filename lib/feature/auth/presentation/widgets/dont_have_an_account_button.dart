import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class DontHaveAnAccountButton extends StatelessWidget {
  const DontHaveAnAccountButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        AppStrings.dontHaveAnAccount,
        style: AppTextStyles.forgotPasswordTxt.copyWith(
          fontSize: 13,
          color: AppColors.lightGrey,
        ),
      ),
      TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          AppStrings.signup,
          style: AppTextStyles.forgotPasswordTxt.copyWith(
            fontSize: 13,
            color: AppColors.red,
          ),
        ),
      ),
    ],
  );
}
