import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({required this.title, required this.onTap, super.key});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: AppTextStyles.sectionTitle.copyWith(
            color: context.appColors.white,
          ),
        ),
        Icon(Icons.arrow_right, color: context.appColors.white, size: 42),
      ],
    ),
  );
}
