import 'package:flutter/material.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/constants/app_textstyles.dart';
import 'package:marvel_stream/core/extensions/color_extension.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';
import 'package:marvel_stream/feature/movie/presentation/widgets/detail_tab.dart';
import 'package:marvel_stream/feature/movie/presentation/widgets/more_info_tab.dart';
import 'package:marvel_stream/feature/movie/presentation/widgets/trailer_tab.dart';

class MovieDetailTabs extends StatelessWidget {
  const MovieDetailTabs({
    required this.movie,
    required this.tabController,
    super.key,
  });

  final MovieEntity movie;
  final TabController tabController;

  @override
  Widget build(final BuildContext context) => Column(
    children: <Widget>[
      TabBar(
        controller: tabController,
        tabs: <Widget>[
          Tab(text: context.locale.trailer, icon: const Icon(Icons.movie)),
          Tab(text: context.locale.details, icon: const Icon(Icons.details)),
          Tab(text: context.locale.moreInfo, icon: const Icon(Icons.read_more_outlined)),
        ],
        indicatorColor: context.appColors.red,
        dividerColor: Colors.transparent,
        labelStyle: AppTextStyles.movieDetailTitle.copyWith(
          fontSize: 18,
          color: context.appColors.white,
        ),
      ),
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            MovieTrailerTab(movie.trailerUrl),
            DetailsTab(movie: movie),
            MoreInfoTab(movie: movie),
          ],
        ),
      ),
    ],
  );
}
