import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';
import 'package:marvel_stream/feature/home/domain/use_cases/movies_use_case.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {

  MoviesBloc({required this.moviesUseCase}) : super(MoviesInitial()) {
    on<LoadAllMoviesEvent>(_onLoadAllMovies);
    on<RefreshMoviesEvent>(_onRefreshMovies);
  }
  final MoviesUseCase moviesUseCase;

  Future<void> _onLoadAllMovies(
      final LoadAllMoviesEvent event,
      final Emitter<MoviesState> emit,
      ) async {
    await _loadMovies(emit);
  }

  Future<void> _onRefreshMovies(
      final RefreshMoviesEvent event,
      final Emitter<MoviesState> emit,
      ) async {
    await _loadMovies(emit);
  }

  Future<void> _loadMovies(final Emitter<MoviesState> emit) async {
    emit(MoviesLoading());

    final Either<Failure, List<MovieEntity>> result =
    await moviesUseCase.getAllMovies();

    result.fold(
          (final Failure failure) => emit(MoviesError(message: failure.message)),
          (final List<MovieEntity> movies) {
        final List<MovieEntity> latestMovies = _getLatestMovies(movies);
        final List<MovieEntity> trendingMovies = _getTrendingMovies(movies);
        final List<MovieEntity> oldMovies = _getOldMovies(movies);
        emit(
          MoviesReady(
            allMovies: movies,
            latestMovies: latestMovies,
            trendingMovies: trendingMovies,
            oldMovies: oldMovies,
          ),
        );
      },
    );
  }

  List<MovieEntity> _getLatestMovies(final List<MovieEntity> movies) {
    final List<MovieEntity> validMovies =
    movies.where((final MovieEntity m) => m.releaseDate != null).toList()
      ..sort(
            (final MovieEntity a, final MovieEntity b) =>
            b.releaseDate!.compareTo(a.releaseDate!),
      );
    return validMovies.take(5).toList();
  }

  List<MovieEntity> _getTrendingMovies(final List<MovieEntity> movies) {
    final DateTime now = DateTime.now();
    final List<MovieEntity> validMovies =
    movies.where((final MovieEntity m) => m.releaseDate != null).toList();

    /// Group by time periods
    final Iterable<MovieEntity> currentYear = validMovies.where(
          (final MovieEntity m) => m.releaseDate!.year == now.year,
    );
    final Iterable<MovieEntity> lastYear = validMovies.where(
          (final MovieEntity m) => m.releaseDate!.year == now.year - 1,
    );
    final Iterable<MovieEntity> twoYearsAgo = validMovies.where(
          (final MovieEntity m) => m.releaseDate!.year == now.year - 2,
    );
    final Iterable<MovieEntity> older = validMovies.where(
          (final MovieEntity m) => m.releaseDate!.year < now.year - 2,
    );

    /// Sort each group by trending score
    final List<MovieEntity> sortedCurrent = _sortByTrendingScore(
      currentYear,
      now,
      100,
    );
    final List<MovieEntity> sortedLastYear = _sortByTrendingScore(
      lastYear,
      now,
      50,
    );
    final List<MovieEntity> sortedTwoYears = _sortByTrendingScore(
      twoYearsAgo,
      now,
      25,
    );
    final List<MovieEntity> sortedOlder = _sortByTrendingScore(
      older,
      now,
      10,
    );

    /// Combine results
    final List<MovieEntity> trendingMovies = <MovieEntity>[
      ...sortedCurrent.take(2),
      ...sortedLastYear.take(2),
      ...sortedTwoYears.take(2),
      ...sortedOlder.take(2),
    ];

    // Fill remaining slots if needed
    if (trendingMovies.length < 5) {
      final List<MovieEntity> remaining =
      validMovies
          .where((final MovieEntity m) => !trendingMovies.contains(m))
          .toList()
        ..sort(
              (final MovieEntity a, final MovieEntity b) =>
              _calculateTrendingScore(
                b,
                now,
                1,
              ).compareTo(_calculateTrendingScore(a, now, 1)),
        );

      trendingMovies.addAll(remaining.take(5 - trendingMovies.length));
    }

    return trendingMovies.take(8).toList();
  }

  List<MovieEntity> _getOldMovies(final List<MovieEntity> movies) {
    final DateTime now = DateTime.now();
    final DateTime cutoffDate = DateTime(now.year - 5);

    final List<MovieEntity> oldMovies = movies
        .where((final MovieEntity m) =>
    m.releaseDate != null &&
        m.releaseDate!.isBefore(cutoffDate))
        .toList()

    // Simply sort by release date (oldest first)
    ..sort((final MovieEntity a, final MovieEntity b) =>
        a.releaseDate!.compareTo(b.releaseDate!));

    return oldMovies.take(8).toList();
  }

  List<MovieEntity> _sortByTrendingScore(
      final Iterable<MovieEntity> movies,
      final DateTime now,
      final double recencyBoost,
      ) => movies.toList()..sort(
        (final MovieEntity a, final MovieEntity b) => _calculateTrendingScore(
      b,
      now,
      recencyBoost,
    ).compareTo(_calculateTrendingScore(a, now, recencyBoost)),
  );

  double _calculateTrendingScore(
      final MovieEntity movie,
      final DateTime now,
      final double recencyBoost,
      ) {
    final double boxOffice = double.tryParse(movie.boxOffice ?? '0') ?? 0;
    if (movie.releaseDate == null) {
      return boxOffice;
    }

    final int daysSinceRelease = now.difference(movie.releaseDate!).inDays;
    final double recencyFactor =
        recencyBoost / (1 + (daysSinceRelease / 365.0));
    return boxOffice + recencyFactor;
  }
}