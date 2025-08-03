import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({required this.title, required this.onTap, super.key});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  <Widget>[Text(title, style: AppTextStyles.sectionTitle),
       const Icon(Icons.arrow_right, color: AppColors.white,size: 42,),]
    ,),
  );
}
