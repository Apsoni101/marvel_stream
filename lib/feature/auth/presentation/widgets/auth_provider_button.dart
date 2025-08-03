import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class AuthProviderButton extends StatelessWidget {
  const AuthProviderButton({
    required this.onPressed,
    required this.asset,
    required this.title,
    super.key,
  });

  final VoidCallback onPressed;
  final String asset;
  final String title;

  @override
  Widget build(final BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    style: const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(AppColors.white),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(),
      ),
      padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      ),
    ),
    child: Row(
      spacing: 4,
      children: <Widget>[
        SvgPicture.asset(
          asset,
          width: 36,
          height: 36,
          placeholderBuilder:
              (final BuildContext context) => const CircularProgressIndicator(),
        ),
        Text(
          title,
          style: AppTextStyles.hintTxtStyle.copyWith(color: AppColors.black),
        ),
      ],
    ),
  );
}
