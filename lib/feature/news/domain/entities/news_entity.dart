import 'package:equatable/equatable.dart';

import 'package:marvel_stream/feature/news/domain/entities/character_entity.dart';
import 'package:marvel_stream/feature/news/domain/entities/comic_entity.dart';
import 'package:marvel_stream/feature/news/domain/entities/creator_entity.dart';
import 'package:marvel_stream/feature/news/domain/entities/next_previous_entity.dart';
import 'package:marvel_stream/feature/news/domain/entities/series_entity.dart';
import 'package:marvel_stream/feature/news/domain/entities/story_entity.dart';
import 'package:marvel_stream/feature/news/domain/entities/thumbnail_entity.dart';
import 'package:marvel_stream/feature/news/domain/entities/url_entity.dart';

class NewsEntity extends Equatable {

  const NewsEntity({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.modified,
    this.start,
    this.end,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.series,
    this.next,
    this.previous,
  });
  final int? id;
  final String? title;
  final String? description;
  final String? resourceUri;
  final List<UrlEntity>? urls;
  final String? modified;
  final String? start;
  final String? end;
  final ThumbnailEntity? thumbnail;
  final CreatorsEntity? creators;
  final CharactersEntity? characters;
  final StoriesEntity? stories;
  final ComicsEntity? comics;
  final SeriesEntity? series;
  final NextPreviousEntity? next;
  final NextPreviousEntity? previous;

  @override
  List<Object?> get props => <Object?>[
    id,
    title,
    description,
    resourceUri,
    urls,
    modified,
    start,
    end,
    thumbnail,
    creators,
    characters,
    stories,
    comics,
    series,
    next,
    previous,
  ];

  NewsEntity copyWith({
    final int? id,
    final String? title,
    final String? description,
    final String? resourceUri,
    final List<UrlEntity>? urls,
    final String? modified,
    final String? start,
    final String? end,
    final ThumbnailEntity? thumbnail,
    final CreatorsEntity? creators,
    final CharactersEntity? characters,
    final StoriesEntity? stories,
    final ComicsEntity? comics,
    final SeriesEntity? series,
    final NextPreviousEntity? next,
    final NextPreviousEntity? previous,
  }) => NewsEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      resourceUri: resourceUri ?? this.resourceUri,
      urls: urls ?? this.urls,
      modified: modified ?? this.modified,
      start: start ?? this.start,
      end: end ?? this.end,
      thumbnail: thumbnail ?? this.thumbnail,
      creators: creators ?? this.creators,
      characters: characters ?? this.characters,
      stories: stories ?? this.stories,
      comics: comics ?? this.comics,
      series: series ?? this.series,
      next: next ?? this.next,
      previous: previous ?? this.previous,
    );
}
