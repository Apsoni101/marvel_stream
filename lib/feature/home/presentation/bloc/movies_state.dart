part of 'movies_bloc.dart';

@immutable
sealed class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object?> get props => <Object?>[];
}

final class MoviesInitial extends MoviesState {}

final class MoviesReady extends MoviesState {
  const MoviesReady({
    this.allMovies = const SectionState<MovieEntity>(),
    this.latestMovies = const SectionState<MovieEntity>(),
    this.trendingMovies = const SectionState<MovieEntity>(),
    this.oldMovies = const SectionState<MovieEntity>(),
  });

  final SectionState<MovieEntity> allMovies;
  final SectionState<MovieEntity> latestMovies;
  final SectionState<MovieEntity> trendingMovies;
  final SectionState<MovieEntity> oldMovies;

  MoviesReady copyWith({
    final SectionState<MovieEntity>? allMovies,
    final SectionState<MovieEntity>? latestMovies,
    final SectionState<MovieEntity>? trendingMovies,
    final SectionState<MovieEntity>? oldMovies,
  }) => MoviesReady(
    allMovies: allMovies ?? this.allMovies,
    latestMovies: latestMovies ?? this.latestMovies,
    trendingMovies: trendingMovies ?? this.trendingMovies,
    oldMovies: oldMovies ?? this.oldMovies,
  );

  @override
  List<Object?> get props => <Object?>[
    allMovies,
    latestMovies,
    trendingMovies,
    oldMovies,
  ];
}
