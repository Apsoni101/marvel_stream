import 'package:marvel_stream/feature/characters/domain/entities/collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/story_item_entity.dart';

class StoriesCollectionEntity extends CollectionEntity {
  const StoriesCollectionEntity({
    super.available,
    super.collectionURI,
    super.returned,
    this.items,
  });

  final List<StoryItemEntity>? items;

  @override
  StoriesCollectionEntity copyWith({
    final int? available,
    final String? collectionURI,
    final int? returned,
    final List<StoryItemEntity>? items,
  }) => StoriesCollectionEntity(
    available: available ?? this.available,
    collectionURI: collectionURI ?? this.collectionURI,
    returned: returned ?? this.returned,
    items: items ?? this.items,
  );

  @override
  List<Object?> get props => <Object?>[
    available,
    collectionURI,
    returned,
    items,
  ];
}
