import 'package:marvel_stream/feature/characters/domain/entities/collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/comic_item_entity.dart';

class ComicsCollectionEntity extends CollectionEntity {
  const ComicsCollectionEntity({
    super.available,
    super.collectionURI,
    super.returned,
    this.items,
  });

  final List<ComicItemEntity>? items;

  @override
  ComicsCollectionEntity copyWith({
    final int? available,
    final String? collectionURI,
    final int? returned,
    final List<ComicItemEntity>? items,
  }) => ComicsCollectionEntity(
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
