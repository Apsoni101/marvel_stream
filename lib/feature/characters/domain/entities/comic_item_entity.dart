import 'package:marvel_stream/feature/characters/domain/entities/base_resource_entity.dart';

class ComicItemEntity extends BaseResourceEntity {
  const ComicItemEntity({
    super.resourceURI,
    super.name,
  });

  ComicItemEntity copyWith({
    final String? resourceURI,
    final String? name,
  }) => ComicItemEntity(
      resourceURI: resourceURI ?? this.resourceURI,
      name: name ?? this.name,
    );
}