part of 'news_bloc.dart';

@immutable
sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class LoadNewsEvent extends NewsEvent {
  const LoadNewsEvent();
}

class LoadMoreNewsEvent extends NewsEvent {
  const LoadMoreNewsEvent();
}

class RefreshNewsEvent extends NewsEvent {
  const RefreshNewsEvent();
}
