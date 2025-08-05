import 'package:equatable/equatable.dart';

class UrlEntity extends Equatable {

  const UrlEntity({this.type, this.url});
  final String? type;
  final String? url;

  @override
  List<Object?> get props => [type, url];

  UrlEntity copyWith({
    final String? type,
    final String? url,
  }) => UrlEntity(
      type: type ?? this.type,
      url: url ?? this.url,
    );
}
