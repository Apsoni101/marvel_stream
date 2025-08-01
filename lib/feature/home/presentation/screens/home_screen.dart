import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/constants/app_strings.dart';
import 'package:marvel_stream/core/di/app_injector.dart';
import 'package:marvel_stream/core/navigation/app_router.gr.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';
import 'package:marvel_stream/feature/home/presentation/bloc/movies_bloc.dart';
import 'package:marvel_stream/feature/home/presentation/widgets/grid_view_movies_section.dart';
import 'package:marvel_stream/feature/home/presentation/widgets/home_screen_app_bar.dart';
import 'package:marvel_stream/feature/home/presentation/widgets/horizontal_listview_movies_section.dart';
import 'package:marvel_stream/feature/home/presentation/widgets/movie_section.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider<MoviesBloc>(
    create:
        (final BuildContext context) =>
            AppInjector.getIt<MoviesBloc>()..add(const LoadAllMoviesEvent()),
    child: Scaffold(
      appBar: const HomeScreenAppBar(),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder:
            (final BuildContext context, final MoviesState state) =>
                switch (state) {
                  MoviesInitial() || MoviesLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  MoviesReady(
                    :final List<MovieEntity> allMovies,
                    :final List<MovieEntity> latestMovies,
                    :final List<MovieEntity> trendingMovies,
                    :final List<MovieEntity> oldMovies,
                  ) =>
                    _buildContent(
                      context,
                      allMovies,
                      latestMovies,
                      trendingMovies,
                      oldMovies,
                    ),
                  MoviesError(:final String message) => Center(
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                },
      ),
    ),
  );

  Widget _buildContent(
    final BuildContext context,
    final List<MovieEntity> allMovies,
    final List<MovieEntity> latestMovies,
    final List<MovieEntity> trendingMovies,
    final List<MovieEntity> oldMovies,
  ) => ListView(
    padding: const EdgeInsets.symmetric(vertical: 30),
    children: <Widget>[
      MovieSection(
        title: AppStrings.upcomingMovies,
        movies: latestMovies,
        onMovieTap: (final MovieEntity movie) async {
          await context.router.push(MovieDetailRoute(movie: movie));
        },
      ),
      MovieSection(
        title: AppStrings.trendingNow,
        movies: trendingMovies,
        onMovieTap: (final MovieEntity movie) async {
          await context.router.push(MovieDetailRoute(movie: movie));
        },
      ),
      HorizontalLisViewMoviesSection(
        title: AppStrings.oldMovies,
        movies: oldMovies,
        onMovieTap: (final MovieEntity movie) async {
          await context.router.push(MovieDetailRoute(movie: movie));
        },
      ),
      GridViewMoviesSection(
        title: AppStrings.allMoviesCollection,
        movies: allMovies,
        onMovieTap: (final MovieEntity movie) async {
          await context.router.push(MovieDetailRoute(movie: movie));
        },
      ),
    ],
  );
}
