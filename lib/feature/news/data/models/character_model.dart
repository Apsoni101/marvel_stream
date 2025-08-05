import 'package:marvel_stream/feature/news/domain/entities/character_entity.dart';

class CharactersModel extends CharactersEntity {
  const CharactersModel({
    super.available,
    super.collectionUri,
    super.items,
    super.returned,
  });

  factory CharactersModel.fromJson(final Map<String, dynamic> json) =>
      CharactersModel(
        available: json['available'],
        collectionUri: json['collectionURI'],
        items:
            json['items'] != null
                ? List<CharacterItemModel>.from(
                  json['items'].map(
                    (final x) => CharacterItemModel.fromJson(x),
                  ),
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
              (final CharacterItemEntity x) =>
                  (x as CharacterItemModel).toJson(),
            )
            .toList(),
    'returned': returned,
  };
}

class CharacterItemModel extends CharacterItemEntity {
  const CharacterItemModel({super.resourceUri, super.name});

  factory CharacterItemModel.fromJson(final Map<String, dynamic> json) =>
      CharacterItemModel(resourceUri: json['resourceURI'], name: json['name']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resourceURI': resourceUri,
    'name': name,
  };
}
