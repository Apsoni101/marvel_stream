import 'package:marvel_stream/feature/characters/domain/entities/story_item_entity.dart';

class StoryItemModel extends StoryItemEntity {
  const StoryItemModel({super.resourceURI, super.name, super.type});

  factory StoryItemModel.fromJson(final Map<String, dynamic> json) =>
      StoryItemModel(
        resourceURI: json['resourceURI'],
        name: json['name'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resourceURI': resourceURI,
    'name': name,
    'type': type,
  };
}
