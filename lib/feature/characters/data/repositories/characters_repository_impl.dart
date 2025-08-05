import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/enums/marvel_api_enums.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/characters/data/data_sources/characters_remote_datasource.dart';
import 'package:marvel_stream/feature/characters/domain/entities/character_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/comics_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/events_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/series_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/stories_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersRepositoryImpl({required this.remoteDataSource});

  final CharactersRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters({
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
    final String? orderBy,
  }) => remoteDataSource.getCharacters(
    limit: limit,
    offset: offset,
    nameStartsWith: nameStartsWith,
    modifiedSince: modifiedSince,
    orderBy: orderBy
  ,);

  @override
  Future<Either<Failure, CharacterEntity>> getCharacterById(
    final int characterId,
  ) => remoteDataSource.getCharacterById(characterId);

  @override
  Future<Either<Failure, ComicsCollectionEntity>> getCharacterComics(
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
  }) => remoteDataSource.getCharacterComics(
    characterId,
    limit: limit,
    offset: offset,
    format: format,
    formatType: formatType,
    noVariants: noVariants,
    dateDescriptor: dateDescriptor,
    dateRangeStart: dateRangeStart,
    dateRangeEnd: dateRangeEnd,
    hasDigitalIssue: hasDigitalIssue,
    titleStartsWith: titleStartsWith,
    modifiedSince: modifiedSince,
  );

  @override
  Future<Either<Failure, EventsCollectionEntity>> getCharacterEvents(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
  }) => remoteDataSource.getCharacterEvents(
    characterId,
    limit: limit,
    offset: offset,
    nameStartsWith: nameStartsWith,
    modifiedSince: modifiedSince,
  );

  @override
  Future<Either<Failure, SeriesCollectionEntity>> getCharacterSeries(
    final int characterId, {
    final int? limit,
    final int? offset,
    final SeriesType? seriesType,
    final ComicFormat? contains,
    final bool? containsVariants,
    final int? year,
    final String? titleStartsWith,
    final String? modifiedSince,
  }) => remoteDataSource.getCharacterSeries(
    characterId,
    limit: limit,
    offset: offset,
    seriesType: seriesType,
    contains: contains,
    containsVariants: containsVariants,
    year: year,
    titleStartsWith: titleStartsWith,
    modifiedSince: modifiedSince,
  );

  @override
  Future<Either<Failure, StoriesCollectionEntity>> getCharacterStories(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? modifiedSince,
  }) => remoteDataSource.getCharacterStories(
    characterId,
    limit: limit,
    offset: offset,
    modifiedSince: modifiedSince,
  );

  @override
  Future<Either<Failure, List<CharacterEntity>>> searchCharacters({
    required final String query,
    final int? limit,
    final int? offset,
  }) => remoteDataSource.searchCharacters(
    query: query,
    limit: limit,
    offset: offset,
  );
}
