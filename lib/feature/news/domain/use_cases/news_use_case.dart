// news_use_case.dart
import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/news/domain/entities/news_entity.dart';
import 'package:marvel_stream/feature/news/domain/repositories/news_repository.dart';

class NewsUseCase {
  NewsUseCase({required this.repository});

  final NewsRepository repository;

  Future<Either<Failure, List<NewsEntity>>> getNews({
    final int offset = 0,
    final int limit = 10,
  }) => repository.getNews(offset: offset, limit: limit);
}
