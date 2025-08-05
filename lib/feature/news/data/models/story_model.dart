import 'package:marvel_stream/feature/news/domain/entities/story_entity.dart';

class StoriesModel extends StoriesEntity {
  const StoriesModel({
    super.available,
    super.collectionUri,
    super.items,
    super.returned,
  });

  factory StoriesModel.fromJson(final Map<String, dynamic> json) =>
      StoriesModel(
        available: json['available'],
        collectionUri: json['collectionURI'],
        items:
            json['items'] != null
                ? List<StoryItemModel>.from(
                  json['items'].map((final x) => StoryItemModel.fromJson(x)),
                )
                : null,
        returned: json['returned'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'available': available,
    'collectionURI': collectionUri,
    'items':
        items
            ?.map((final StoryItemEntity x) => (x as StoryItemModel).toJson())
            .toList(),
    'returned': returned,
  };
}

class StoryItemModel extends StoryItemEntity {
  const StoryItemModel({super.resourceUri, super.name, super.type});

  factory StoryItemModel.fromJson(final Map<String, dynamic> json) =>
      StoryItemModel(
        resourceUri: json['resourceURI'],
        name: json['name'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resourceURI': resourceUri,
    'name': name,
    'type': type,
  };
}
