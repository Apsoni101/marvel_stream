import 'package:marvel_stream/feature/news/domain/entities/series_entity.dart';

class SeriesModel extends SeriesEntity {
  const SeriesModel({
    super.available,
    super.collectionUri,
    super.items,
    super.returned,
  });

  factory SeriesModel.fromJson(final Map<String, dynamic> json) => SeriesModel(
    available: json['available'],
    collectionUri: json['collectionURI'],
    items:
        json['items'] != null
            ? List<SeriesItemModel>.from(
              json['items'].map((final x) => SeriesItemModel.fromJson(x)),
            )
            : null,
    returned: json['returned'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'available': available,
    'collectionURI': collectionUri,
    'items':
        items
            ?.map((final SeriesItemEntity x) => (x as SeriesItemModel).toJson())
            .toList(),
    'returned': returned,
  };
}

class SeriesItemModel extends SeriesItemEntity {
  const SeriesItemModel({super.resourceUri, super.name});

  factory SeriesItemModel.fromJson(final Map<String, dynamic> json) =>
      SeriesItemModel(resourceUri: json['resourceURI'], name: json['name']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resourceURI': resourceUri,
    'name': name,
  };
}
