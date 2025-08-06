import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';

class BackgroundImageForegroundTextWidget extends StatelessWidget {
  const BackgroundImageForegroundTextWidget({
    required this.image,
    required this.text,
    super.key,
  });

  final String image;
  final String text;

  @override
  Widget build(final BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: AppTextStyles.continueTxtStyle.copyWith(
          color: context.appColors.permanentWhite,
          fontSize: 20,
          decoration: TextDecoration.none,
        ),
      ),
    ),
  );
}
