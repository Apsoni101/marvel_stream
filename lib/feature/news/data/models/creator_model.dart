import 'package:marvel_stream/feature/news/domain/entities/creator_entity.dart';

class CreatorsModel extends CreatorsEntity {
  const CreatorsModel({
    super.available,
    super.collectionUri,
    super.items,
    super.returned,
  });

  factory CreatorsModel.fromJson(final Map<String, dynamic> json) =>
      CreatorsModel(
        available: json['available'],
        collectionUri: json['collectionURI'],
        items:
            json['items'] != null
                ? List<CreatorItemModel>.from(
                  json['items'].map((final x) => CreatorItemModel.fromJson(x)),
                )
                : null,
        returned: json['returned'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'available': available,
    'collectionURI': collectionUri,
    'items':
        items
            ?.map(
              (final CreatorItemEntity x) => (x as CreatorItemModel).toJson(),
            )
            .toList(),
    'returned': returned,
  };
}

class CreatorItemModel extends CreatorItemEntity {
  const CreatorItemModel({super.resourceUri, super.name, super.role});

  factory CreatorItemModel.fromJson(final Map<String, dynamic> json) =>
      CreatorItemModel(
        resourceUri: json['resourceURI'],
        name: json['name'],
        role: json['role'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resourceURI': resourceUri,
    'name': name,
    'role': role,
  };
}
