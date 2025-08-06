import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/constants/asset_constants.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
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
      NewsRoute(),
      MoreRoute(),
    ],
    bottomNavigationBuilder:
        (_, final TabsRouter tabsRouter) => BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: context.appColors.red,
          unselectedItemColor: context.appColors.white,
          backgroundColor: context.appColors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.homeIc,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  tabsRouter.activeIndex == 0 ? context.appColors.red : context.appColors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: context.locale.home,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.categoriesIc,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  tabsRouter.activeIndex == 1 ? context.appColors.red : context.appColors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: context.locale.comics,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.downloadsIc,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  tabsRouter.activeIndex == 2 ? context.appColors.red : context.appColors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: context.locale.characters,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.newsIc,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  tabsRouter.activeIndex == 3 ? context.appColors.red : context.appColors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: context.locale.news,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.moreIc,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  tabsRouter.activeIndex == 4 ? context.appColors.red : context.appColors.white,
                  BlendMode.srcIn,
                ),
              ),
              label: context.locale.more,
            ),
          ],
        ),
  );
}
