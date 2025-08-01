import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';

class HomeScreenAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const HomeScreenAppBar({super.key});

  @override
  Widget build(final BuildContext context) => AppBar(
      title: AspectRatio(
        aspectRatio: 100 / 16,
        child: SvgPicture.asset(AppAssets.appTextLogo),
      ),
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(
            AppAssets.spiderManProfileIc,
            width: 52,
            height: 52,
          ),
        ),
      ],
    );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
