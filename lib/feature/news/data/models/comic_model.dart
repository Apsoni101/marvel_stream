import 'package:marvel_stream/feature/news/domain/entities/comic_entity.dart';

class ComicsModel extends ComicsEntity {
  const ComicsModel({
    super.available,
    super.collectionUri,
    super.items,
    super.returned,
  });

  factory ComicsModel.fromJson(final Map<String, dynamic> json) => ComicsModel(
    available: json['available'],
    collectionUri: json['collectionURI'],
    items:
        json['items'] != null
            ? List<ComicItemModel>.from(
              json['items'].map((final x) => ComicItemModel.fromJson(x)),
            )
            : null,
    returned: json['returned'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'available': available,
    'collectionURI': collectionUri,
    'items':
        items
            ?.map((final ComicItemEntity x) => (x as ComicItemModel).toJson())
            .toList(),
    'returned': returned,
  };
}

class ComicItemModel extends ComicItemEntity {
  const ComicItemModel({super.resourceUri, super.name});

  factory ComicItemModel.fromJson(final Map<String, dynamic> json) =>
      ComicItemModel(resourceUri: json['resourceURI'], name: json['name']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resourceURI': resourceUri,
    'name': name,
  };
}
