import 'package:marvel_stream/feature/characters/domain/entities/collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/series_item_entity.dart';

class SeriesCollectionEntity extends CollectionEntity {
  const SeriesCollectionEntity({
    super.available,
    super.collectionURI,
    super.returned,
    this.items,
  });

  final List<SeriesItemEntity>? items;

  @override
  SeriesCollectionEntity copyWith({
    final int? available,
    final String? collectionURI,
    final int? returned,
    final List<SeriesItemEntity>? items,
  }) => SeriesCollectionEntity(
    available: available ?? this.available,
    collectionURI: collectionURI ?? this.collectionURI,
    returned: returned ?? this.returned,
    items: items ?? this.items,
  );

  @override
  List<Object?> get props => <Object?>[available, collectionURI, returned, items];
}
