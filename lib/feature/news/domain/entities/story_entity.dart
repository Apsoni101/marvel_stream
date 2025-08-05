import 'package:equatable/equatable.dart';

class StoriesEntity extends Equatable {
  const StoriesEntity({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<StoryItemEntity>? items;
  final int? returned;

  @override
  List<Object?> get props => <Object?>[
    available,
    collectionUri,
    items,
    returned,
  ];

  StoriesEntity copyWith({
    final int? available,
    final String? collectionUri,
    final List<StoryItemEntity>? items,
    final int? returned,
  }) => StoriesEntity(
    available: available ?? this.available,
    collectionUri: collectionUri ?? this.collectionUri,
    items: items ?? this.items,
    returned: returned ?? this.returned,
  );
}

class StoryItemEntity extends Equatable {
  const StoryItemEntity({this.resourceUri, this.name, this.type});

  final String? resourceUri;
  final String? name;
  final String? type;

  @override
  List<Object?> get props => <Object?>[resourceUri, name, type];

  StoryItemEntity copyWith({
    final String? resourceUri,
    final String? name,
    final String? type,
  }) => StoryItemEntity(
    resourceUri: resourceUri ?? this.resourceUri,
    name: name ?? this.name,
    type: type ?? this.type,
  );
}
