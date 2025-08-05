import 'package:marvel_stream/feature/news/domain/entities/next_previous_entity.dart';

class NextPreviousModel extends NextPreviousEntity {
  const NextPreviousModel({super.resourceUri, super.name});

  factory NextPreviousModel.fromJson(final Map<String, dynamic> json) =>
      NextPreviousModel(resourceUri: json['resourceURI'], name: json['name']);

  Map<String, dynamic> toJson() => <String,dynamic>{'resourceURI': resourceUri, 'name': name};
}
