import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/enums/marvel_api_enums.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/core/services/firebase/remote_config.dart';
import 'package:marvel_stream/core/services/networking/network_constants.dart';
import 'package:marvel_stream/core/services/networking/network_service.dart';
import 'package:marvel_stream/feature/characters/data/models/character_model.dart';
import 'package:marvel_stream/feature/characters/data/models/comics_collection_model.dart';
import 'package:marvel_stream/feature/characters/data/models/events_collection_model.dart';
import 'package:marvel_stream/feature/characters/data/models/series_collection_model.dart';
import 'package:marvel_stream/feature/characters/data/models/stories_collection_model.dart';

abstract class CharactersRemoteDataSource {
  // Characters
  Future<Either<Failure, List<CharacterModel>>> getCharacters({
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
    final String? orderBy,
  });

  Future<Either<Failure, CharacterModel>> getCharacterById(
    final int characterId,
  );

  // Comics
  Future<Either<Failure, ComicsCollectionModel>> getCharacterComics(
    final int characterId, {
    final int? limit,
    final int? offset,
    final ComicFormat? format,
    final ComicFormatType? formatType,
    final bool? noVariants,
    final DateDescriptor? dateDescriptor,
    final String? dateRangeStart,
    final String? dateRangeEnd,
    final bool? hasDigitalIssue,
    final String? titleStartsWith,
    final String? modifiedSince,
  });

  // Events
  Future<Either<Failure, EventsCollectionModel>> getCharacterEvents(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
  });

  // Series
  Future<Either<Failure, SeriesCollectionModel>> getCharacterSeries(
    final int characterId, {
    final int? limit,
    final int? offset,
    final SeriesType? seriesType,
    final ComicFormat? contains,
    final bool? containsVariants,
    final int? year,
    final String? titleStartsWith,
    final String? modifiedSince,
  });

  // Stories
  Future<Either<Failure, StoriesCollectionModel>> getCharacterStories(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? modifiedSince,
  });

  // Search
  Future<Either<Failure, List<CharacterModel>>> searchCharacters({
    required final String query,
    final int? limit,
    final int? offset,
  });
}

class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {
  CharactersRemoteDataSourceImpl({required this.networkService});

  final NetworkService networkService;

  Map<String, String> _baseParams() => <String, String>{
    'ts': RemoteConfig.timestamp,
    'apikey': RemoteConfig.apiKey,
    'hash': RemoteConfig.hash,
  };

  @override
  Future<Either<Failure, List<CharacterModel>>> getCharacters({
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
    final String? orderBy,
  })  {
    final Map<String, String> params = <String, String>{
      ..._baseParams(),
      if (limit != null) 'limit': limit.toString(),
      if (offset != null) 'offset': offset.toString(),
      if (nameStartsWith != null) 'nameStartsWith': nameStartsWith,
      if (modifiedSince != null) 'modifiedSince': modifiedSince,
      if (orderBy != null) 'orderBy': orderBy,
    };

    return networkService.getPath<List<CharacterModel>>(
      NetworkConstants.characters,
      queryParams: params,
      parser: (final dynamic data) {
        final List<dynamic> dataList = data['data']['results'];
        final List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
          dataList,
        );
        return list.map(CharacterModel.fromJson).toList();
      },
    );
  }

  @override
  Future<Either<Failure, CharacterModel>> getCharacterById(
    final int characterId,
  ) {
    final Map<String, String> params = _baseParams();

    return networkService.getPath<CharacterModel>(
      '${NetworkConstants.characters}/$characterId',
      queryParams: params,
      parser: (final dynamic data) {
        final Map<String, dynamic> characterData = data['data']['results'][0];
        return CharacterModel.fromJson(characterData);
      },
    );
  }

  @override
  Future<Either<Failure, ComicsCollectionModel>> getCharacterComics(
    final int characterId, {
    final int? limit,
    final int? offset,
    final ComicFormat? format,
    final ComicFormatType? formatType,
    final bool? noVariants,
    final DateDescriptor? dateDescriptor,
    final String? dateRangeStart,
    final String? dateRangeEnd,
    final bool? hasDigitalIssue,
    final String? titleStartsWith,
    final String? modifiedSince,
  }) {
    final Map<String, String> params = <String, String>{
      ..._baseParams(),
      if (limit != null) 'limit': limit.toString(),
      if (offset != null) 'offset': offset.toString(),
      if (format != null) 'format': format.value,
      if (formatType != null) 'formatType': formatType.value,
      if (noVariants != null) 'noVariants': noVariants.toString(),
      if (dateDescriptor != null) 'dateDescriptor': dateDescriptor.value,
      if (dateRangeStart != null) 'dateRangeStart': dateRangeStart,
      if (dateRangeEnd != null) 'dateRangeEnd': dateRangeEnd,
      if (hasDigitalIssue != null)
        'hasDigitalIssue': hasDigitalIssue.toString(),
      if (titleStartsWith != null) 'titleStartsWith': titleStartsWith,
      if (modifiedSince != null) 'modifiedSince': modifiedSince,
    };

    return networkService.getPath<ComicsCollectionModel>(
      '${NetworkConstants.characters}/$characterId/comics',
      queryParams: params,
      parser:
          (final dynamic data) => ComicsCollectionModel.fromJson(data['data']),
    );
  }

  @override
  Future<Either<Failure, EventsCollectionModel>> getCharacterEvents(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
  })  {
    final Map<String, String> params = <String, String>{
      ..._baseParams(),
      if (limit != null) 'limit': limit.toString(),
      if (offset != null) 'offset': offset.toString(),
      if (nameStartsWith != null) 'nameStartsWith': nameStartsWith,
      if (modifiedSince != null) 'modifiedSince': modifiedSince,
    };

    return networkService.getPath<EventsCollectionModel>(
      '${NetworkConstants.characters}/$characterId/events',
      queryParams: params,
      parser:
          (final dynamic data) => EventsCollectionModel.fromJson(data['data']),
    );
  }

  @override
  Future<Either<Failure, SeriesCollectionModel>> getCharacterSeries(
    final int characterId, {
    final int? limit,
    final int? offset,
    final SeriesType? seriesType,
    final ComicFormat? contains,
    final bool? containsVariants,
    final int? year,
    final String? titleStartsWith,
    final String? modifiedSince,
  })  {
    final Map<String, String> params = <String, String>{
      ..._baseParams(),
      if (limit != null) 'limit': limit.toString(),
      if (offset != null) 'offset': offset.toString(),
      if (seriesType != null) 'seriesType': seriesType.value,
      if (contains != null) 'contains': contains.value,
      if (containsVariants != null)
        'containsVariants': containsVariants.toString(),
      if (year != null) 'year': year.toString(),
      if (titleStartsWith != null) 'titleStartsWith': titleStartsWith,
      if (modifiedSince != null) 'modifiedSince': modifiedSince,
    };

    return networkService.getPath<SeriesCollectionModel>(
      '${NetworkConstants.characters}/$characterId/series',
      queryParams: params,
      parser:
          (final dynamic data) => SeriesCollectionModel.fromJson(data['data']),
    );
  }

  @override
  Future<Either<Failure, StoriesCollectionModel>> getCharacterStories(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? modifiedSince,
  })  {
    final Map<String, String> params = <String, String>{
      ..._baseParams(),
      if (limit != null) 'limit': limit.toString(),
      if (offset != null) 'offset': offset.toString(),
      if (modifiedSince != null) 'modifiedSince': modifiedSince,
    };

    return networkService.getPath<StoriesCollectionModel>(
      '${NetworkConstants.characters}/$characterId/stories',
      queryParams: params,
      parser:
          (final dynamic data) => StoriesCollectionModel.fromJson(data['data']),
    );
  }

  @override
  Future<Either<Failure, List<CharacterModel>>> searchCharacters({
    required final String query,
    final int? limit,
    final int? offset,
  })  {
    final Map<String, String> params = <String, String>{
      ..._baseParams(),
      'nameStartsWith': query,
      if (limit != null) 'limit': limit.toString(),
      if (offset != null) 'offset': offset.toString(),
    };

    return networkService.getPath<List<CharacterModel>>(
      NetworkConstants.characters,
      queryParams: params,
      parser: (final dynamic data) {
        final List<dynamic> dataList = data['data']['results'];
        final List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(
          dataList,
        );
        return list.map(CharacterModel.fromJson).toList();
      },
    );
  }
}
