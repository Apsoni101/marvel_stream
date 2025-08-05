import 'package:marvel_stream/feature/news/data/models/character_model.dart';
import 'package:marvel_stream/feature/news/data/models/comic_model.dart';
import 'package:marvel_stream/feature/news/data/models/creator_model.dart';
import 'package:marvel_stream/feature/news/data/models/next_previous_model.dart';
import 'package:marvel_stream/feature/news/data/models/series_model.dart';
import 'package:marvel_stream/feature/news/data/models/story_model.dart';
import 'package:marvel_stream/feature/news/data/models/thumbnail_model.dart';
import 'package:marvel_stream/feature/news/data/models/url_model.dart';
import 'package:marvel_stream/feature/news/domain/entities/news_entity.dart';
import 'package:marvel_stream/feature/news/domain/entities/url_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel({
    super.id,
    super.title,
    super.description,
    super.resourceUri,
    super.urls,
    super.modified,
    super.start,
    super.end,
    super.thumbnail,
    super.creators,
    super.characters,
    super.stories,
    super.comics,
    super.series,
    super.next,
    super.previous,
  });

  factory NewsModel.fromJson(final Map<String, dynamic> json) => NewsModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    resourceUri: json['resourceURI'],
    urls:
        json['urls'] != null
            ? List<UrlModel>.from(
              json['urls'].map((final x) => UrlModel.fromJson(x)),
            )
            : null,
    modified: json['modified'],
    start: json['start'],
    end: json['end'],
    thumbnail:
        json['thumbnail'] != null
            ? ThumbnailModel.fromJson(json['thumbnail'])
            : null,
    creators:
        json['creators'] != null
            ? CreatorsModel.fromJson(json['creators'])
            : null,
    characters:
        json['characters'] != null
            ? CharactersModel.fromJson(json['characters'])
            : null,
    stories:
        json['stories'] != null ? StoriesModel.fromJson(json['stories']) : null,
    comics:
        json['comics'] != null ? ComicsModel.fromJson(json['comics']) : null,
    series:
        json['series'] != null ? SeriesModel.fromJson(json['series']) : null,
    next:
        json['next'] != null ? NextPreviousModel.fromJson(json['next']) : null,
    previous:
        json['previous'] != null
            ? NextPreviousModel.fromJson(json['previous'])
            : null,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'description': description,
    'resourceURI': resourceUri,
    'urls': urls?.map((final UrlEntity x) => (x as UrlModel).toJson()).toList(),
    'modified': modified,
    'start': start,
    'end': end,
    'thumbnail': (thumbnail as ThumbnailModel?)?.toJson(),
    'creators': (creators as CreatorsModel?)?.toJson(),
    'characters': (characters as CharactersModel?)?.toJson(),
    'stories': (stories as StoriesModel?)?.toJson(),
    'comics': (comics as ComicsModel?)?.toJson(),
    'series': (series as SeriesModel?)?.toJson(),
    'next': (next as NextPreviousModel?)?.toJson(),
    'previous': (previous as NextPreviousModel?)?.toJson(),
  };
}
