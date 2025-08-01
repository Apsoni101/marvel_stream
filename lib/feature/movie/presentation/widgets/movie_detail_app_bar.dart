import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';

class MovieDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MovieDetailAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(final BuildContext context) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => context.router.pop(),
        icon: const Icon(
          Icons.keyboard_backspace,
          size: 32,
          color: AppColors.white,
        ),
      ),
    );
}
