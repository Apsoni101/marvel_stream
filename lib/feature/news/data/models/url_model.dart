import 'package:marvel_stream/feature/news/domain/entities/url_entity.dart';

class UrlModel extends UrlEntity {
  const UrlModel({super.type, super.url});

  factory UrlModel.fromJson(final Map<String, dynamic> json) =>
      UrlModel(type: json['type'], url: json['url']);

  Map<String, dynamic> toJson() => <String,dynamic>{'type': type, 'url': url};
}
