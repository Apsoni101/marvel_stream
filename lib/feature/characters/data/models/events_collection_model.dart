import 'package:marvel_stream/feature/characters/data/models/event_item_model.dart';
import 'package:marvel_stream/feature/characters/domain/entities/events_collection_entity.dart';

class EventsCollectionModel extends EventsCollectionEntity {
  const EventsCollectionModel({
    super.available,
    super.collectionURI,
    super.returned,
    super.items,
  });

  factory EventsCollectionModel.fromJson(Map<String, dynamic> json) {
    List<EventItemModel>? itemsList;
    final itemsJson = json['items'];
    if (itemsJson != null) {
      itemsList = [];
      for (final item in itemsJson) {
        itemsList.add(EventItemModel.fromJson(item));
      }
    }

    return EventsCollectionModel(
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
      'items': items?.map((item) => (item as EventItemModel).toJson()).toList(),
    };
  }
}