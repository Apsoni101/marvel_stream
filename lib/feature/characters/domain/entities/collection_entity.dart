import 'package:equatable/equatable.dart';

class CollectionEntity extends Equatable {

  const CollectionEntity({this.available, this.collectionURI, this.returned});
  final int? available;
  final String? collectionURI;
  final int? returned;

  CollectionEntity copyWith({
    final int? available,
    final String? collectionURI,
    final int? returned,
  }) => CollectionEntity(
    available: available,
    collectionURI: collectionURI,
    returned: returned,
  );

  @override
  List<Object?> get props => <Object?>[available, collectionURI, returned];
}
