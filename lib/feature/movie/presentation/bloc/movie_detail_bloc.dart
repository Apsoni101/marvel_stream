import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';



class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(const MovieDetailInitial()) {
  }


}

