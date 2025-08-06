import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(final BuildContext context) => Column(
    spacing: 25,
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 34),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.circularAvatarBg),
            fit: BoxFit.fill,
          ),
        ),
        child: const CircleAvatar(
          radius: 150,
          backgroundImage: AssetImage(AppAssets.avatar1),
        ),
      ),
      Text(
        "UIUXDIVYANSHU",
        style: AppTextStyles.movieDetailTitle.copyWith(
          fontSize: 24,
          color: context.appColors.white,
        ),
      ),
    ],
  );
}
