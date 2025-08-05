import 'package:marvel_stream/feature/characters/data/models/comic_item_model.dart';
import 'package:marvel_stream/feature/characters/domain/entities/comic_item_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/comics_collection_entity.dart';

class ComicsCollectionModel extends ComicsCollectionEntity {
  const ComicsCollectionModel({
    super.available,
    super.collectionURI,
    super.returned,
    super.items,
  });

  factory ComicsCollectionModel.fromJson(final Map<String, dynamic> json) {
    List<ComicItemModel>? itemsList;
    final itemsJson = json['items'];
    if (itemsJson != null) {
      itemsList = <ComicItemModel>[];
      for (final item in itemsJson) {
        itemsList.add(ComicItemModel.fromJson(item));
      }
    }

    return ComicsCollectionModel(
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
              (final ComicItemEntity item) => (item as ComicItemModel).toJson(),
            )
            .toList(),
  };
}
