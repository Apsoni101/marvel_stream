import 'package:marvel_stream/feature/characters/domain/entities/base_resource_entity.dart';

class StoryItemEntity extends BaseResourceEntity {

  const StoryItemEntity({super.resourceURI, super.name, this.type});
  final String? type;

  StoryItemEntity copyWith({
    final String? resourceURI,
    final String? name,
    final String? type,
  }) => StoryItemEntity(
    resourceURI: resourceURI ?? this.resourceURI,
    name: name ?? this.name,
    type: type ?? this.type,
  );

  @override
  List<Object?> get props => <Object?>[resourceURI, name, type];
}
