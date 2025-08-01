part of 'movie_detail_bloc.dart';

@immutable
sealed  class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => <Object?>[];
}

class MovieDetailInitial extends MovieDetailState {
  const MovieDetailInitial();
}

class MovieTrailerLoading extends MovieDetailState {
  const MovieTrailerLoading();
}

class MovieTrailerLoaded extends MovieDetailState {

  const MovieTrailerLoaded(this.url);
  final String url;

  @override
  List<Object?> get props => <Object?>[url];
}

class MovieTrailerError extends MovieDetailState {

  const MovieTrailerError(this.message);
  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}
