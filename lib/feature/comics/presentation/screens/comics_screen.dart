import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_colors.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/constants/app_textstyles.dart';
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
              border: Border.all(color: AppColors.red, width: 2),
            ),
            child: const TabBar(
              dividerColor: Colors.transparent,
              unselectedLabelColor: AppColors.white,
              labelColor: AppColors.white,
              labelStyle: AppTextStyles.sectionTitle,
              indicator: BoxDecoration(color: AppColors.red),
              indicatorPadding: EdgeInsets.all(2),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: <Widget>[
                Tab(text: AppStrings.comics),
                Tab(text: AppStrings.series),
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
