import 'package:marvel_stream/feature/characters/data/models/story_item_model.dart';
import 'package:marvel_stream/feature/characters/domain/entities/stories_collection_entity.dart';

class StoriesCollectionModel extends StoriesCollectionEntity {
  const StoriesCollectionModel({
    super.available,
    super.collectionURI,
    super.returned,
    super.items,
  });

  factory StoriesCollectionModel.fromJson(Map<String, dynamic> json) {
    List<StoryItemModel>? itemsList;
    final itemsJson = json['items'];
    if (itemsJson != null) {
      itemsList = [];
      for (final item in itemsJson) {
        itemsList.add(StoryItemModel.fromJson(item));
      }
    }

    return StoriesCollectionModel(
      available: json['available'],
      collectionURI: json['collectionURI'],
      returned: json['returned'],
      items: itemsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'available': available,
      'collectionURI': collectionURI,
      'returned': returned,
      'items': items?.map((item) => (item as StoryItemModel).toJson()).toList(),
    };
  }
}