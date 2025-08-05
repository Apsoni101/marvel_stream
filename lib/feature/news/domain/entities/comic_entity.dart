import 'package:equatable/equatable.dart';

class ComicsEntity extends Equatable {
  const ComicsEntity({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<ComicItemEntity>? items;
  final int? returned;

  @override
  List<Object?> get props => <Object?>[
    available,
    collectionUri,
    items,
    returned,
  ];

  ComicsEntity copyWith({
    final int? available,
    final String? collectionUri,
    final List<ComicItemEntity>? items,
    final int? returned,
  }) => ComicsEntity(
    available: available ?? this.available,
    collectionUri: collectionUri ?? this.collectionUri,
    items: items ?? this.items,
    returned: returned ?? this.returned,
  );
}

class ComicItemEntity extends Equatable {
  const ComicItemEntity({this.resourceUri, this.name});

  final String? resourceUri;
  final String? name;

  @override
  List<Object?> get props => <Object?>[resourceUri, name];
}
