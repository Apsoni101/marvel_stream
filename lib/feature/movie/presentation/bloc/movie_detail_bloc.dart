import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';



class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(const MovieDetailInitial()) {
    on<LoadMovieTrailer>(_onLoadMovieTrailer);
  }

  Future<void> _onLoadMovieTrailer(
      LoadMovieTrailer event,
      Emitter<MovieDetailState> emit,
      ) async {
    emit(const MovieTrailerLoading());
    try {
      // Just validate or simulate processing logic
      if (event.url.isEmpty) {
        throw Exception('URL is empty');
      }

      await Future.delayed(const Duration(milliseconds: 500)); // fake load
      emit(MovieTrailerLoaded(event.url));
    } catch (_) {
      emit(const MovieTrailerError('Failed to load trailer'));
    }
  }
}

