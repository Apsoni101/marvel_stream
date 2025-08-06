import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';
import 'package:marvel_stream/feature/comics/presentation/widgets/comics_tab_bar_body.dart';
import 'package:marvel_stream/feature/comics/presentation/widgets/series_tab_bar_body.dart';

@RoutePage()
class ComicsScreen extends StatelessWidget {
  const ComicsScreen({super.key});

  @override
  Widget build(final BuildContext context) => DefaultTabController(
    length: 2,
    child: SafeArea(
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: context.appColors.red, width: 2),
            ),
            child: TabBar(
              dividerColor: Colors.transparent,
              unselectedLabelColor: context.appColors.white,
              labelColor: context.appColors.permanentWhite,
              labelStyle: AppTextStyles.sectionTitle.copyWith(
                color: context.appColors.permanentWhite,
              ),
              indicator: BoxDecoration(color: context.appColors.red),
              indicatorPadding: const EdgeInsets.all(2),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: <Widget>[
                Tab(text: context.locale.comics),
                Tab(text: context.locale.series),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: <Widget>[ComicsTabBarBody(), SeriesTabBarBody()],
            ),
          ),
        ],
      ),
    ),
  );
}
