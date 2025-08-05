part of 'movies_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object?> get props => <Object?>[];
}

final class LoadMovieLists extends MoviesEvent {
  const LoadMovieLists();
}

final class RefreshMoviesEvent extends MoviesEvent {
  const RefreshMoviesEvent();
}

final class FetchLatestMovies extends MoviesEvent {
  const FetchLatestMovies();
}

final class FetchTrendingMovies extends MoviesEvent {
  const FetchTrendingMovies();
}

final class FetchOldMovies extends MoviesEvent {
  const FetchOldMovies();
}

final class FetchAllMovies extends MoviesEvent {
  const FetchAllMovies();
}
