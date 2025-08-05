import 'package:equatable/equatable.dart';

class NextPreviousEntity extends Equatable {
  const NextPreviousEntity({this.resourceUri, this.name});

  final String? resourceUri;
  final String? name;

  @override
  List<Object?> get props => <Object?>[resourceUri, name];

  NextPreviousEntity copyWith({
    final String? resourceUri,
    final String? name,
  }) => NextPreviousEntity(
    resourceUri: resourceUri ?? this.resourceUri,
    name: name ?? this.name,
  );
}
