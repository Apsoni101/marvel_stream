import 'package:equatable/equatable.dart';

class SeriesEntity extends Equatable {
  const SeriesEntity({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<SeriesItemEntity>? items;
  final int? returned;

  @override
  List<Object?> get props => <Object?>[
    available,
    collectionUri,
    items,
    returned,
  ];

  SeriesEntity copyWith({
    final int? available,
    final String? collectionUri,
    final List<SeriesItemEntity>? items,
    final int? returned,
  }) => SeriesEntity(
    available: available ?? this.available,
    collectionUri: collectionUri ?? this.collectionUri,
    items: items ?? this.items,
    returned: returned ?? this.returned,
  );
}

class SeriesItemEntity extends Equatable {
  const SeriesItemEntity({this.resourceUri, this.name});

  final String? resourceUri;
  final String? name;

  @override
  List<Object?> get props => <Object?>[resourceUri, name];

  SeriesItemEntity copyWith({final String? resourceUri, final String? name}) =>
      SeriesItemEntity(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
      );
}
