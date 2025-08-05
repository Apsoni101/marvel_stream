import 'package:equatable/equatable.dart';

class CharactersEntity extends Equatable {
  const CharactersEntity({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<CharacterItemEntity>? items;
  final int? returned;

  @override
  List<Object?> get props => <Object?>[
    available,
    collectionUri,
    items,
    returned,
  ];

  CharactersEntity copyWith({
    final int? available,
    final String? collectionUri,
    final List<CharacterItemEntity>? items,
    final int? returned,
  }) => CharactersEntity(
    available: available ?? this.available,
    collectionUri: collectionUri ?? this.collectionUri,
    items: items ?? this.items,
    returned: returned ?? this.returned,
  );
}

class CharacterItemEntity extends Equatable {
  const CharacterItemEntity({this.resourceUri, this.name});

  final String? resourceUri;
  final String? name;

  @override
  List<Object?> get props => <Object?>[resourceUri, name];

  CharacterItemEntity copyWith({
    final String? resourceUri,
    final String? name,
  }) => CharacterItemEntity(
    resourceUri: resourceUri ?? this.resourceUri,
    name: name ?? this.name,
  );
}
