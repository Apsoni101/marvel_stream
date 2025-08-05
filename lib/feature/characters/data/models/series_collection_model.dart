import 'package:marvel_stream/feature/characters/data/models/series_item_model.dart';
import 'package:marvel_stream/feature/characters/domain/entities/series_collection_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/series_item_entity.dart';

class SeriesCollectionModel extends SeriesCollectionEntity {
  const SeriesCollectionModel({
    super.available,
    super.collectionURI,
    super.returned,
    super.items,
  });

  factory SeriesCollectionModel.fromJson(final Map<String, dynamic> json) {
    List<SeriesItemModel>? itemsList;
    final itemsJson = json['items'];
    if (itemsJson != null) {
      itemsList = <SeriesItemModel>[];
      for (final item in itemsJson) {
        itemsList.add(SeriesItemModel.fromJson(item));
      }
    }

    return SeriesCollectionModel(
      available: json['available'],
      collectionURI: json['collectionURI'],
      returned: json['returned'],
      items: itemsList,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'available': available,
    'collectionURI': collectionURI,
    'returned': returned,
    'items':
        items
            ?.map(
              (final SeriesItemEntity item) =>
                  (item as SeriesItemModel).toJson(),
            )
            .toList(),
  };
}
