import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/enums/marvel_api_enums.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/characters/domain/entities/character_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/comics_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/events_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/series_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/stories_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/repositories/characters_repository.dart';

class CharactersUseCase {
  CharactersUseCase({required this.repository});

  final CharactersRepository repository;

  Future<Either<Failure, List<CharacterEntity>>> getCharacters({
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
    final String? orderBy,
  }) => repository.getCharacters(
    limit: limit,
    offset: offset,
    nameStartsWith: nameStartsWith,
    modifiedSince: modifiedSince,
    orderBy: orderBy,
  );

  Future<Either<Failure, CharacterEntity>> getCharacter(
    final int characterId,
  ) => repository.getCharacterById(characterId);

  Future<Either<Failure, ComicsCollectionEntity>> getComics(
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
  }) => repository.getCharacterComics(
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

  Future<Either<Failure, EventsCollectionEntity>> getEvents(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
  }) => repository.getCharacterEvents(
    characterId,
    limit: limit,
    offset: offset,
    nameStartsWith: nameStartsWith,
    modifiedSince: modifiedSince,
  );

  Future<Either<Failure, SeriesCollectionEntity>> getSeries(
    final int characterId, {
    final int? limit,
    final int? offset,
    final SeriesType? seriesType,
    final ComicFormat? contains,
    final bool? containsVariants,
    final int? year,
    final String? titleStartsWith,
    final String? modifiedSince,
  }) => repository.getCharacterSeries(
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

  Future<Either<Failure, StoriesCollectionEntity>> getStories(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? modifiedSince,
  }) => repository.getCharacterStories(
    characterId,
    limit: limit,
    offset: offset,
    modifiedSince: modifiedSince,
  );

  //  Search characters
  Future<Either<Failure, List<CharacterEntity>>> search(
    final String query, {
    final int? limit,
    final int? offset,
  }) => repository.searchCharacters(query: query, limit: limit, offset: offset);
}
