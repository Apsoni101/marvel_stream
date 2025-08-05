import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/news/domain/entities/news_entity.dart';
import 'package:marvel_stream/feature/news/domain/use_cases/news_use_case.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  NewsBloc({required this.newsUseCase}) : super(const NewsInitial()) {
    on<LoadNewsEvent>(_onLoadNews);
    on<LoadMoreNewsEvent>(_onLoadMoreNews);
    on<RefreshNewsEvent>(_onRefreshNews);
  }

  final NewsUseCase newsUseCase;
  static const int _pageSize = 10;

  Future<void> _onLoadNews(
    final LoadNewsEvent event,
    final Emitter<NewsState> emit,
  ) async {
    emit(const NewsLoading());

    final Either<Failure, List<NewsEntity>> result =
        await newsUseCase.getNews();

    result.fold(
      (final Failure failure) => emit(NewsError(message: failure.message)),
      (final List<NewsEntity> news) => emit(
        NewsLoaded(
          news: news,
          hasMore: news.length >= _pageSize,
          currentOffset: news.length,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreNews(
    final LoadMoreNewsEvent event,
    final Emitter<NewsState> emit,
  ) async {
    if (state is NewsLoaded) {
      final NewsLoaded currentState = state as NewsLoaded;
      if (!currentState.hasMore) {
        return;
      }

      emit(NewsLoadingMore(currentNews: currentState.news));

      final Either<Failure, List<NewsEntity>> result = await newsUseCase
          .getNews(offset: currentState.currentOffset);

      result.fold(
        (final Failure failure) => emit(NewsError(message: failure.message)),
        (final List<NewsEntity> newNews) {
          final List<NewsEntity> allNews = <NewsEntity>[
            ...currentState.news,
            ...newNews,
          ];
          emit(
            NewsLoaded(
              news: allNews,
              hasMore: newNews.length >= _pageSize,
              currentOffset: allNews.length,
            ),
          );
        },
      );
    }
  }

  Future<void> _onRefreshNews(
    final RefreshNewsEvent event,
    final Emitter<NewsState> emit,
  ) async {
    emit(const NewsLoading());

    final Either<Failure, List<NewsEntity>> result =
        await newsUseCase.getNews();

    result.fold(
      (final Failure failure) => emit(NewsError(message: failure.message)),
      (final List<NewsEntity> news) => emit(
        NewsLoaded(
          news: news,
          hasMore: news.length >= _pageSize,
          currentOffset: news.length,
        ),
      ),
    );
  }
}
