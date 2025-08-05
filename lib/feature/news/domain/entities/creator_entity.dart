import 'package:equatable/equatable.dart';

class CreatorsEntity extends Equatable {
  const CreatorsEntity({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<CreatorItemEntity>? items;
  final int? returned;

  @override
  List<Object?> get props => <Object?>[
    available,
    collectionUri,
    items,
    returned,
  ];

  CreatorsEntity copyWith({
    final int? available,
    final String? collectionUri,
    final List<CreatorItemEntity>? items,
    final int? returned,
  }) => CreatorsEntity(
    available: available ?? this.available,
    collectionUri: collectionUri ?? this.collectionUri,
    items: items ?? this.items,
    returned: returned ?? this.returned,
  );
}

class CreatorItemEntity extends Equatable {
  const CreatorItemEntity({this.resourceUri, this.name, this.role});

  final String? resourceUri;
  final String? name;
  final String? role;

  @override
  List<Object?> get props => <Object?>[resourceUri, name, role];

  CreatorItemEntity copyWith({
    final String? resourceUri,
    final String? name,
    final String? role,
  }) => CreatorItemEntity(
    resourceUri: resourceUri ?? this.resourceUri,
    name: name ?? this.name,
    role: role ?? this.role,
  );
}
