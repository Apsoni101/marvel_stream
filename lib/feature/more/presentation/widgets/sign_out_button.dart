import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({required this.onPressed, super.key, required this.isLoading});

  final VoidCallback? onPressed;
  final bool isLoading;


  @override
  Widget build(final BuildContext context) => TextButton(
    style: TextButton.styleFrom(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.zero
    ,),
    onPressed: isLoading ? null : onPressed,
    child: isLoading? const CircularProgressIndicator() : const Text(
      AppStrings.signOut,
      style: AppTextStyles.sectionTitle,
    ),
  );
}
