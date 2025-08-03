import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(final BuildContext context) => SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          children: <Widget>[
            const Spacer(),
            Expanded(
              flex: 4,
              child: AspectRatio(
                aspectRatio: 80 / 16,
                child: SvgPicture.asset(AppAssets.appTextLogo),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset(
                AppAssets.avatar1,
                width: 52,
                height: 52,
              ),
            ),
          ],
        ),
      ),
    );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
