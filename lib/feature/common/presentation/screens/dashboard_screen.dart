import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(final BuildContext context) => AutoTabsScaffold(
    routes: const <PageRouteInfo<Object?>>[
      HomeRoute(),
      ComicsRoute(),
      CharactersRoute(),
      MoreRoute(),
    ],
    bottomNavigationBuilder:
        (_, final TabsRouter tabsRouter) => BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.red,
          unselectedItemColor: AppColors.white,
          backgroundColor: AppColors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.homeIc,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  tabsRouter.activeIndex == 0 ? AppColors.red : AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: AppStrings.home,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.categoriesIc,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  tabsRouter.activeIndex == 1 ? AppColors.red : AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: AppStrings.comics,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.downloadsIc,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  tabsRouter.activeIndex == 2 ? AppColors.red : AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: AppStrings.characters,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.moreIc,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  tabsRouter.activeIndex == 3 ? AppColors.red : AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: AppStrings.more,
            ),
          ],
        ),
  );
}
