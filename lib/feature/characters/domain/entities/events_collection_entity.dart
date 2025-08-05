import 'package:marvel_stream/feature/characters/domain/entities/collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/event_item_entity.dart';

class EventsCollectionEntity extends CollectionEntity {

  const EventsCollectionEntity({
    super.available,
    super.collectionURI,
    super.returned,
    this.items,
  });
  final List<EventItemEntity>? items;

  @override
  EventsCollectionEntity copyWith({
    final int? available,
    final String? collectionURI,
    final int? returned,
    final List<EventItemEntity>? items,
  }) => EventsCollectionEntity(
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
