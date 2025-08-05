import 'package:equatable/equatable.dart';
import 'package:marvel_stream/feature/characters/domain/entities/comics_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/events_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/series_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/stories_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/thumbnail_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/url_entity.dart';

class CharacterEntity extends Equatable {

  const CharacterEntity({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final ThumbnailEntity? thumbnail;
  final String? resourceURI;
  final ComicsCollectionEntity? comics;
  final SeriesCollectionEntity? series;
  final StoriesCollectionEntity? stories;
  final EventsCollectionEntity? events;
  final List<UrlEntity>? urls;

  CharacterEntity copyWith({
    final int? id,
    final String? name,
    final String? description,
    final String? modified,
    final ThumbnailEntity? thumbnail,
    final String? resourceURI,
    final ComicsCollectionEntity? comics,
    final SeriesCollectionEntity? series,
    final StoriesCollectionEntity? stories,
    final EventsCollectionEntity? events,
    final List<UrlEntity>? urls,
  }) => CharacterEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    modified: modified ?? this.modified,
    thumbnail: thumbnail ?? this.thumbnail,
    resourceURI: resourceURI ?? this.resourceURI,
    comics: comics ?? this.comics,
    series: series ?? this.series,
    stories: stories ?? this.stories,
    events: events ?? this.events,
    urls: urls ?? this.urls,
  );

  @override
  List<Object?> get props => <Object?>[
    id,
    name,
    description,
    modified,
    thumbnail,
    resourceURI,
    comics,
    series,
    stories,
    events,
    urls,
  ];
}
