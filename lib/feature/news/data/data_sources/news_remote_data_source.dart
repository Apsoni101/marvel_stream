// news_remote_data_source.dart
import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/core/services/networking/network_constants.dart';
import 'package:marvel_stream/core/services/networking/network_service.dart';
import 'package:marvel_stream/feature/news/data/models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<Either<Failure, List<NewsModel>>> getNews({
    final int offset = 0,
    final int limit = 10,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl({required this.networkService});

  final NetworkService networkService;

  @override
  Future<Either<Failure, List<NewsModel>>> getNews({
    final int offset = 0,
    final int limit = 10,
  }) => networkService.getPath<List<NewsModel>>(
    NetworkConstants.movies,
    queryParams: <String, dynamic>{'offset': offset, 'limit': limit},
    parser: (final dynamic data) {
      final List<dynamic> dataList = data['data']['results'];
      final List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
        dataList,
      );
      return list.map(NewsModel.fromJson).toList();
    },
  );
}
