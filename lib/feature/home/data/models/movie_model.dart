import 'package:marvel_stream/feature/home/domain/entities/movie_entity.dart';

class MovieItemModel extends MovieEntity {
  const MovieItemModel({
    super.id,
    super.title,
    super.releaseDate,
    super.boxOffice,
    super.duration,
    super.overview,
    super.coverUrl,
    super.trailerUrl,
    super.directedBy,
    super.phase,
    super.saga,
    super.chronology,
    super.postCreditScenes,
    super.imdbId,
    super.updatedAt,
  });

  factory MovieItemModel.fromJson(final Map<String, dynamic> json) => MovieItemModel(
    id: json['id'] ?? 0,
    title: json['title'] ?? '',
    releaseDate:
        DateTime.tryParse(json['release_date'] ?? '') ?? DateTime(1970),
    boxOffice: json['box_office'],
    duration: json['duration'],
    overview: json['overview'],
    coverUrl: json['cover_url'] ?? '',
    trailerUrl: json['trailer_url'],
    directedBy: json['directed_by'] ?? '',
    phase: json['phase'] ?? 0,
    saga: json['saga'],
    chronology: json['chronology'] ?? 0,
    postCreditScenes: json['post_credit_scenes'] ?? 0,
    imdbId: json['imdb_id'] ?? '',
    updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime(1970),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'release_date': releaseDate.toString(),
    'box_office': boxOffice,
    'duration': duration,
    'overview': overview,
    'cover_url': coverUrl,
    'trailer_url': trailerUrl,
    'directed_by': directedBy,
    'phase': phase,
    'saga': saga,
    'chronology': chronology,
    'post_credit_scenes': postCreditScenes,
    'imdb_id': imdbId,
    'updated_at': updatedAt.toString(),
  };
}
