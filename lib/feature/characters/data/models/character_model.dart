import 'package:marvel_stream/feature/characters/data/models/comics_collection_model.dart';
import 'package:marvel_stream/feature/characters/data/models/events_collection_model.dart';
import 'package:marvel_stream/feature/characters/data/models/series_collection_model.dart';
import 'package:marvel_stream/feature/characters/data/models/stories_collection_model.dart';
import 'package:marvel_stream/feature/characters/data/models/thumbnail_model.dart';
import 'package:marvel_stream/feature/characters/data/models/url_model.dart';
import 'package:marvel_stream/feature/characters/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    super.id,
    super.name,
    super.description,
    super.modified,
    super.thumbnail,
    super.resourceURI,
    super.comics,
    super.series,
    super.stories,
    super.events,
    super.urls,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    ThumbnailModel? thumbnailModel;
    final  thumbnailJson = json['thumbnail'];
    if (thumbnailJson != null) {
      thumbnailModel = ThumbnailModel.fromJson(thumbnailJson);
    }

    ComicsCollectionModel? comicsModel;
    final comicsJson = json['comics'];
    if (comicsJson != null) {
      comicsModel = ComicsCollectionModel.fromJson(comicsJson);
    }

    SeriesCollectionModel? seriesModel;
    final seriesJson = json['series'];
    if (seriesJson != null) {
      seriesModel = SeriesCollectionModel.fromJson(seriesJson);
    }

    StoriesCollectionModel? storiesModel;
    final storiesJson = json['stories'];
    if (storiesJson != null) {
      storiesModel = StoriesCollectionModel.fromJson(storiesJson);
    }

    EventsCollectionModel? eventsModel;
    final eventsJson = json['events'];
    if (eventsJson != null) {
      eventsModel = EventsCollectionModel.fromJson(eventsJson);
    }

    List<UrlModel>? urlsList;
    final urlsJson = json['urls'];
    if (urlsJson != null) {
      urlsList = [];
      for (final url in urlsJson) {
        urlsList.add(UrlModel.fromJson(url));
      }
    }

    return CharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      thumbnail: thumbnailModel,
      resourceURI: json['resourceURI'],
      comics: comicsModel,
      series: seriesModel,
      stories: storiesModel,
      events: eventsModel,
      urls: urlsList,
    );
  }

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'description': description,
      'modified': modified,
      'thumbnail': (thumbnail as ThumbnailModel?)?.toJson(),
      'resourceURI': resourceURI,
      'comics': (comics as ComicsCollectionModel?)?.toJson(),
      'series': (series as SeriesCollectionModel?)?.toJson(),
      'stories': (stories as StoriesCollectionModel?)?.toJson(),
      'events': (events as EventsCollectionModel?)?.toJson(),
      'urls': urls?.map((url) => (url as UrlModel).toJson()).toList(),
    };
}
