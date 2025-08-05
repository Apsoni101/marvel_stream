import 'package:marvel_stream/feature/characters/domain/entities/series_item_entity.dart';

class SeriesItemModel extends SeriesItemEntity {
  const SeriesItemModel({super.resourceURI, super.name});

  factory SeriesItemModel.fromJson(final Map<String, dynamic> json) =>
      SeriesItemModel(resourceURI: json['resourceURI'], name: json['name']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resourceURI': resourceURI,
    'name': name,
  };
}
