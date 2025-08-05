import 'package:marvel_stream/feature/characters/domain/entities/base_resource_entity.dart';

class EventItemEntity extends BaseResourceEntity {
  const EventItemEntity({super.resourceURI, super.name});

  EventItemEntity copyWith({final String? resourceURI, final String? name}) =>
      EventItemEntity(
        resourceURI: resourceURI ?? this.resourceURI,
        name: name ?? this.name,
      );
}
