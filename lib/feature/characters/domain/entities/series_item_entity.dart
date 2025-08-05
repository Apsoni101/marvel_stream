import 'package:marvel_stream/feature/characters/domain/entities/base_resource_entity.dart';

class SeriesItemEntity extends BaseResourceEntity {
  const SeriesItemEntity({
    super.resourceURI,
    super.name,
  });

  SeriesItemEntity copyWith({
    final String? resourceURI,
    final String? name,
  }) => SeriesItemEntity(
      resourceURI: resourceURI ?? this.resourceURI,
      name: name ?? this.name,
    );
}
