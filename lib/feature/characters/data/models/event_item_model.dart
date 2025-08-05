import 'package:marvel_stream/feature/characters/domain/entities/event_item_entity.dart';

class EventItemModel extends EventItemEntity {
  const EventItemModel({super.resourceURI, super.name});

  factory EventItemModel.fromJson(final Map<String, dynamic> json) =>
      EventItemModel(resourceURI: json['resourceURI'], name: json['name']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resourceURI': resourceURI,
    'name': name,
  };
}
