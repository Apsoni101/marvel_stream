// news_state.dart
part of 'news_bloc.dart';

@immutable
sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => <Object?>[];
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsLoadingMore extends NewsState {
  const NewsLoadingMore({required this.currentNews});

  final List<NewsEntity> currentNews;

  @override
  List<Object?> get props => <Object?>[currentNews];
}

class NewsLoaded extends NewsState {
  const NewsLoaded({
    required this.news,
    required this.hasMore,
    required this.currentOffset,
  });

  final List<NewsEntity> news;
  final bool hasMore;
  final int currentOffset;

  @override
  List<Object?> get props => <Object?>[news, hasMore, currentOffset];
}

class NewsError extends NewsState {
  const NewsError({required this.message, this.news});

  final String message;
  final List<NewsEntity>? news;

  @override
  List<Object?> get props => <Object?>[message, news];
}
