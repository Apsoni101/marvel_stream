// news_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/news/data/data_sources/news_remote_data_source.dart';
import 'package:marvel_stream/feature/news/domain/entities/news_entity.dart';
import 'package:marvel_stream/feature/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({required this.remoteDataSource});

  final NewsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews({
    final int offset = 0,
    final int limit = 10,
  }) => remoteDataSource.getNews(offset: offset, limit: limit);
}
