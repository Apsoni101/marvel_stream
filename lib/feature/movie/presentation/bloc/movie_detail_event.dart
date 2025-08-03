part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class LoadMovieTrailer extends MovieDetailEvent {

  const LoadMovieTrailer(this.url);
  final String url;

  @override
  List<Object?> get props => <Object?>[url];
}
