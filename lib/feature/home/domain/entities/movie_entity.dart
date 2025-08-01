import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    this.id,
    this.title,
    this.releaseDate,
    this.boxOffice,
    this.duration,
    this.overview,
    this.coverUrl,
    this.trailerUrl,
    this.directedBy,
    this.phase,
    this.saga,
    this.chronology,
    this.postCreditScenes,
    this.imdbId,
    this.updatedAt,
  });

  final int? id;
  final String? title;
  final DateTime? releaseDate;
  final String? boxOffice;
  final int? duration;
  final String? overview;
  final String? coverUrl;
  final String? trailerUrl;
  final String? directedBy;
  final int? phase;
  final String? saga;
  final int? chronology;
  final int? postCreditScenes;
  final String? imdbId;
  final DateTime? updatedAt;

  MovieEntity copyWith({
    final int? id,
    final String? title,
    final DateTime? releaseDate,
    final String? boxOffice,
    final int? duration,
    final String? overview,
    final String? coverUrl,
    final String? trailerUrl,
    final String? directedBy,
    final int? phase,
    final String? saga,
    final int? chronology,
    final int? postCreditScenes,
    final String? imdbId,
    final DateTime? updatedAt,
  }) => MovieEntity(
    id: id ?? this.id,
    title: title ?? this.title,
    releaseDate: releaseDate ?? this.releaseDate,
    boxOffice: boxOffice ?? this.boxOffice,
    duration: duration ?? this.duration,
    overview: overview ?? this.overview,
    coverUrl: coverUrl ?? this.coverUrl,
    trailerUrl: trailerUrl ?? this.trailerUrl,
    directedBy: directedBy ?? this.directedBy,
    phase: phase ?? this.phase,
    saga: saga ?? this.saga,
    chronology: chronology ?? this.chronology,
    postCreditScenes: postCreditScenes ?? this.postCreditScenes,
    imdbId: imdbId ?? this.imdbId,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  List<Object?> get props => <Object?>[
    id,
    title,
    releaseDate,
    boxOffice,
    duration,
    overview,
    coverUrl,
    trailerUrl,
    directedBy,
    phase,
    saga,
    chronology,
    postCreditScenes,
    imdbId,
    updatedAt,
  ];
}
