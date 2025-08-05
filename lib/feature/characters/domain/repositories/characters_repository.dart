import 'package:dartz/dartz.dart';
import 'package:marvel_stream/core/enums/marvel_api_enums.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/characters/domain/entities/character_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/comics_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/events_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/series_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/stories_collection_entity.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters({
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
    final String? orderBy,
  });

  Future<Either<Failure, CharacterEntity>> getCharacterById(
    final int characterId,
  );

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
  });

  Future<Either<Failure, EventsCollectionEntity>> getCharacterEvents(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? nameStartsWith,
    final String? modifiedSince,
  });

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
  });

  Future<Either<Failure, StoriesCollectionEntity>> getCharacterStories(
    final int characterId, {
    final int? limit,
    final int? offset,
    final String? modifiedSince,
  });

  Future<Either<Failure, List<CharacterEntity>>> searchCharacters({
    required final String query,
    final int? limit,
    final int? offset,
  });
}
