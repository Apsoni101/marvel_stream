import 'package:flutter/material.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/generic_carousel_section.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/grid_view_item_section.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/horizontal_listview_section.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

/// Reusable shimmer/initial placeholder for the Home screen.
/// This mirrors what HomeScreen after loading would display.
class MoviesShimmer extends StatelessWidget {
  const MoviesShimmer({super.key});

  @override
  Widget build(final BuildContext context) => ListView(
    padding: const EdgeInsets.symmetric(vertical: 30),
    children: const <Widget>[
      GenericCarouselSection<MovieEntity>(
        title: AppStrings.upcomingMovies,
        items: <MovieEntity>[],
        coverImageUrlGetter: _getCoverUrl,
        onItemTap: _noop,
        isLoading: true,
      ),
      GenericCarouselSection<MovieEntity>(
        title: AppStrings.trendingNow,
        items: <MovieEntity>[],
        coverImageUrlGetter: _getCoverUrl,
        onItemTap: _noop,
        isLoading: true,
      ),
      HorizontalListViewSection<MovieEntity>(
        title: AppStrings.oldMovies,
        items: <MovieEntity>[],
        coverImageUrlGetter: _getCoverUrl,
        onItemTap: _noop,
        isLoading: true,
      ),
      GridViewItemSection<MovieEntity>(
        title: AppStrings.allMoviesCollection,
        items: <MovieEntity>[],
        coverImageUrlGetter: _getCoverUrl,
        onItemTap: _noop,
        isLoading: true,
      ),
    ],
  );

  static String? _getCoverUrl(final MovieEntity movie) => movie.coverUrl;

  static void _noop(MovieEntity _) {}
}
