part of 'movies_bloc.dart';

@immutable
sealed class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object?> get props => <Object?>[];
}

final class MoviesInitial extends MoviesState {}

final class MoviesLoading extends MoviesState {}

final class MoviesReady extends MoviesState {

  const MoviesReady({
    required this.allMovies,
    required this.latestMovies,
    required this.trendingMovies,
    required this.oldMovies,
  });
  final List<MovieEntity> allMovies;
  final List<MovieEntity> latestMovies;
  final List<MovieEntity> trendingMovies;
  final List<MovieEntity> oldMovies;

  @override
  List<Object?> get props => [allMovies, latestMovies, trendingMovies, oldMovies];
}

final class MoviesError extends MoviesState {

  const MoviesError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}