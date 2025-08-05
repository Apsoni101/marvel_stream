import 'package:equatable/equatable.dart';

class ThumbnailEntity extends Equatable {
  const ThumbnailEntity({this.path, this.extension});

  final String? path;
  final String? extension;

  ThumbnailEntity copyWith({final String? path, final String? extension}) =>
      ThumbnailEntity(
        path: path ?? this.path,
        extension: extension ?? this.extension,
      );

  String? get fullUrl =>
      path != null && extension != null ? '$path.$extension' : null;

  @override
  List<Object?> get props => <Object?>[path, extension];
}
