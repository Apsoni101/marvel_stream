import 'package:marvel_stream/feature/news/domain/entities/thumbnail_entity.dart';

class ThumbnailModel extends ThumbnailEntity {
  const ThumbnailModel({super.path, super.extension});

  factory ThumbnailModel.fromJson(final Map<String, dynamic> json) =>
      ThumbnailModel(path: json['path'], extension: json['extension']);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'path': path,
    'extension': extension,
  };
}
