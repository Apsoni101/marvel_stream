import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/extensions/localization_extension.dart';import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/enums/movies_section_type.dart';
import 'package:marvel_stream/core/enums/section_status.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/feature/characters/domain/entities/section_state.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/error_section_widget.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/generic_carousel_section.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/grid_view_item_section.dart';
import 'package:marvel_stream/feature/common/presentation/widgets/horizontal_listview_section.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';
import 'package:marvel_stream/feature/home/presentation/bloc/movies_bloc.dart';
import 'package:marvel_stream/feature/home/presentation/widgets/home_screen_app_bar.dart';
import 'package:marvel_stream/feature/home/presentation/widgets/movies_shimmer.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider<MoviesBloc>(
    create:
        (final BuildContext context) =>
            AppInjector.getIt<MoviesBloc>()..add(const LoadMovieLists()),
    child: Scaffold(
      appBar: const HomeScreenAppBar(),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder:
            (final BuildContext context, final MoviesState state) =>
                switch (state) {
                  MoviesInitial() => const MoviesShimmer(),
                  MoviesReady() => _buildContent(context, state),
                },
      ),
    ),
  );

  Widget _buildContent(final BuildContext context, final MoviesReady state) =>
      ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: <Widget>[
          _buildSection(
            context: context,
            title: context.locale.upcomingMovies,
            sectionId: MovieSectionId.upcoming,
            sectionState: state.latestMovies,
            layout: MovieSectionType.carousel,
          ),
          _buildSection(
            context: context,
            title: context.locale.trendingNow,
            sectionId: MovieSectionId.trending,
            sectionState: state.trendingMovies,
            layout: MovieSectionType.carousel,
          ),
          _buildSection(
            context: context,
            title: context.locale.oldMovies,
            sectionId: MovieSectionId.old,
            sectionState: state.oldMovies,
            layout: MovieSectionType.horizontal,
          ),
          _buildSection(
            context: context,
            title: context.locale.allMoviesCollection,
            sectionId: MovieSectionId.all,
            sectionState: state.allMovies,
            layout: MovieSectionType.grid,
          ),
        ],
      );

  /// Generic section builder that handles loading, loaded and error states.
  Widget _buildSection({
    required final BuildContext context,
    required final MovieSectionId sectionId,
    required final String title,
    required final SectionState<MovieEntity> sectionState,
    required final MovieSectionType layout,
  }) {
    switch (sectionState.status) {
      case SectionStatus.initial:
      case SectionStatus.loading:
        return _buildLoadingSection(context, title, layout);
      case SectionStatus.loaded:
        return _buildLoadedSection(context, title, sectionState.items, layout);
      case SectionStatus.error:
        return _buildErrorSection(
          context,
          title,
          sectionState.errorMessage ?? 'Unknown error',
          isCarousel: layout == MovieSectionType.carousel,
          retryEvent: _retryEventFor(sectionId),
        );
    }
  }

  MoviesEvent _retryEventFor(final MovieSectionId sectionId) =>
      switch (sectionId) {
        MovieSectionId.upcoming => const FetchLatestMovies(),
        MovieSectionId.trending => const FetchTrendingMovies(),
        MovieSectionId.old => const FetchOldMovies(),
        MovieSectionId.all => const FetchAllMovies(),
      };

  /// Returns the loading (shimmer) variant for the given type.
  Widget _buildLoadingSection(
    final BuildContext context,
    final String title,
    final MovieSectionType layout,
  ) {
    switch (layout) {
      case MovieSectionType.carousel:
        return GenericCarouselSection<MovieEntity>(
          title: title,
          items: const <MovieEntity>[],
          coverImageUrlGetter: (final MovieEntity movie) => movie.coverUrl,
          onItemTap: (final MovieEntity movie) async {
            await _handleMovieTap(context, movie);
          },
          isLoading: true,
        );
      case MovieSectionType.horizontal:
        return HorizontalListViewSection<MovieEntity>(
          title: title,
          items: const <MovieEntity>[],
          onItemTap: (final MovieEntity movie) async {
            await _handleMovieTap(context, movie);
          },
          coverImageUrlGetter: (final MovieEntity movie) => movie.coverUrl,
          isLoading: true,
        );
      case MovieSectionType.grid:
        return GridViewItemSection<MovieEntity>(
          title: title,
          items: const <MovieEntity>[],
          onItemTap: (final MovieEntity movie) async {
            await _handleMovieTap(context, movie);
          },
          coverImageUrlGetter: (final MovieEntity movie) => movie.coverUrl,
          isLoading: true,
        );
    }
  }

  /// Returns the loaded (real data) variant for the given type.
  Widget _buildLoadedSection(
    final BuildContext context,
    final String title,
    final List<MovieEntity> items,
    final MovieSectionType type,
  ) {
    switch (type) {
      case MovieSectionType.carousel:
        return GenericCarouselSection<MovieEntity>(
          title: title,
          items: items,
          coverImageUrlGetter: (final MovieEntity movie) => movie.coverUrl,
          onItemTap: (final MovieEntity movie) async {
            await _handleMovieTap(context, movie);
          },
        );
      case MovieSectionType.horizontal:
        return HorizontalListViewSection<MovieEntity>(
          title: title,
          items: items,
          onItemTap: (final MovieEntity movie) async {
            await _handleMovieTap(context, movie);
          },
          coverImageUrlGetter: (final MovieEntity movie) => movie.coverUrl,
        );
      case MovieSectionType.grid:
        return GridViewItemSection<MovieEntity>(
          title: title,
          items: items,
          onItemTap: (final MovieEntity movie) async {
            await _handleMovieTap(context, movie);
          },
          coverImageUrlGetter: (final MovieEntity movie) => movie.coverUrl,
        );
    }
  }

  /// Error
  Widget _buildErrorSection(
    final BuildContext context,
    final String title,
    final String errorMessage, {
    required final MoviesEvent retryEvent,
    final bool isCarousel = false,
  }) => ErrorSectionWidget(
    title: title,
    errorMessage: errorMessage,
    isCarousel: isCarousel,
    onRetry: () {
      context.read<MoviesBloc>().add(retryEvent);
    },
  );

  Future<void> _handleMovieTap(
    final BuildContext context,
    final MovieEntity movie,
  ) async {
    await context.router.push(MovieDetailRoute(movie: movie));
  }
}
