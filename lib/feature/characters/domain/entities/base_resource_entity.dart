import 'package:equatable/equatable.dart';

abstract class BaseResourceEntity extends Equatable {

  const BaseResourceEntity({
    this.resourceURI,
    this.name,
  });
  final String? resourceURI;
  final String? name;

  @override
  List<Object?> get props => <String?>[resourceURI, name];
}
