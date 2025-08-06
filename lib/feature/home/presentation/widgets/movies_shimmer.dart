import 'package:flutter/material.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';
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
    children: <Widget>[
      GenericCarouselSection<MovieEntity>(
        title: context.locale.upcomingMovies,
        items: const <MovieEntity>[],
        coverImageUrlGetter: _getCoverUrl,
        onItemTap: _noop,
        isLoading: true,
      ),
      GenericCarouselSection<MovieEntity>(
        title: context.locale.trendingNow,
        items: const <MovieEntity>[],
        coverImageUrlGetter: _getCoverUrl,
        onItemTap: _noop,
        isLoading: true,
      ),
      HorizontalListViewSection<MovieEntity>(
        title: context.locale.oldMovies,
        items: const <MovieEntity>[],
        coverImageUrlGetter: _getCoverUrl,
        onItemTap: _noop,
        isLoading: true,
      ),
      GridViewItemSection<MovieEntity>(
        title: context.locale.allMoviesCollection,
        items: const <MovieEntity>[],
        coverImageUrlGetter: _getCoverUrl,
        onItemTap: _noop,
        isLoading: true,
      ),
    ],
  );

  static String? _getCoverUrl(final MovieEntity movie) => movie.coverUrl;

  static void _noop(MovieEntity _) {}
}
