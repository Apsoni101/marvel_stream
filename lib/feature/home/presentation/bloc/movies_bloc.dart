import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/enums/section_status.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/characters/domain/entities/section_state.dart';
import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';
import 'package:marvel_stream/feature/home/domain/use_cases/movies_use_case.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc({required this.moviesUseCase}) : super(MoviesInitial()) {
    on<LoadMovieLists>(_onLoadMovieLists);
    on<RefreshMoviesEvent>(_onRefreshMovies);
    on<FetchLatestMovies>(_onFetchLatestMovies);
    on<FetchTrendingMovies>(_onFetchTrendingMovies);
    on<FetchOldMovies>(_onFetchOldMovies);
    on<FetchAllMovies>(_onFetchAllMovies);
  }

  final MoviesUseCase moviesUseCase;

  Future<void> _onLoadMovieLists(
    final LoadMovieLists event,
    final Emitter<MoviesState> emit,
  ) async {
    const MoviesReady readyState = MoviesReady();
    emit(readyState);

    add(const FetchLatestMovies());
    add(const FetchTrendingMovies());
    add(const FetchOldMovies());
    add(const FetchAllMovies());
  }

  Future<void> _onRefreshMovies(
    final RefreshMoviesEvent event,
    final Emitter<MoviesState> emit,
  ) async {
    add(const LoadMovieLists());
  }

  MoviesReady _getReadyState() =>
      state is MoviesReady ? state as MoviesReady : const MoviesReady();

  Future<void> _onFetchLatestMovies(
    final FetchLatestMovies event,
    final Emitter<MoviesState> emit,
  ) async {
    final MoviesReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        latestMovies: currentState.latestMovies.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<MovieEntity>> result =
        await moviesUseCase.getAllMovies();

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          latestMovies: currentState.latestMovies.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<MovieEntity> movies) {
        final List<MovieEntity> latestMovies = _getLatestMovies(movies);
        emit(
          _getReadyState().copyWith(
            latestMovies: currentState.latestMovies.copyWith(
              status: SectionStatus.loaded,
              items: latestMovies,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onFetchTrendingMovies(
    final FetchTrendingMovies event,
    final Emitter<MoviesState> emit,
  ) async {
    final MoviesReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        trendingMovies: currentState.trendingMovies.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<MovieEntity>> result =
        await moviesUseCase.getAllMovies();

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          trendingMovies: currentState.trendingMovies.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<MovieEntity> movies) {
        final List<MovieEntity> trendingMovies = _getTrendingMovies(movies);
        emit(
          _getReadyState().copyWith(
            trendingMovies: currentState.trendingMovies.copyWith(
              status: SectionStatus.loaded,
              items: trendingMovies,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onFetchOldMovies(
    final FetchOldMovies event,
    final Emitter<MoviesState> emit,
  ) async {
    final MoviesReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        oldMovies: currentState.oldMovies.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<MovieEntity>> result =
        await moviesUseCase.getAllMovies();

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          oldMovies: currentState.oldMovies.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<MovieEntity> movies) {
        final List<MovieEntity> oldMovies = _getOldMovies(movies);
        emit(
          _getReadyState().copyWith(
            oldMovies: currentState.oldMovies.copyWith(
              status: SectionStatus.loaded,
              items: oldMovies,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onFetchAllMovies(
    final FetchAllMovies event,
    final Emitter<MoviesState> emit,
  ) async {
    final MoviesReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        allMovies: currentState.allMovies.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<MovieEntity>> result =
        await moviesUseCase.getAllMovies();

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          allMovies: currentState.allMovies.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<MovieEntity> movies) => emit(
        _getReadyState().copyWith(
          allMovies: currentState.allMovies.copyWith(
            status: SectionStatus.loaded,
            items: movies,
          ),
        ),
      ),
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
    final List<MovieEntity> sortedOlder = _sortByTrendingScore(older, now, 10);

    final List<MovieEntity> trendingMovies = <MovieEntity>[
      ...sortedCurrent.take(2),
      ...sortedLastYear.take(2),
      ...sortedTwoYears.take(2),
      ...sortedOlder.take(2),
    ];

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

    final List<MovieEntity> oldMovies =
        movies
            .where(
              (final MovieEntity m) =>
                  m.releaseDate != null && m.releaseDate!.isBefore(cutoffDate),
            )
            .toList()
          // Simply sort by release date (oldest first)
          ..sort(
            (final MovieEntity a, final MovieEntity b) =>
                a.releaseDate!.compareTo(b.releaseDate!),
          );

    return oldMovies.take(8).toList();
  }

  List<MovieEntity> _sortByTrendingScore(
    final Iterable<MovieEntity> movies,
    final DateTime now,
    final double recencyBoost,
  ) =>
      movies.toList()..sort(
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
