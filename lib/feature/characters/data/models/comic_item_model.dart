import 'package:marvel_stream/feature/characters/domain/entities/comic_item_entity.dart';

class ComicItemModel extends ComicItemEntity {
  const ComicItemModel({super.resourceURI, super.name});

  factory ComicItemModel.fromJson(final Map<String, dynamic> json) =>
      ComicItemModel(resourceURI: json['resourceURI'], name: json['name']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resourceURI': resourceURI,
    'name': name,
  };
}
