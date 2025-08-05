// lib/feature/characters/domain/entities/section_state.dart
import 'package:equatable/equatable.dart';
import 'package:marvel_stream/core/enums/section_status.dart';

class SectionState<T> extends Equatable {

  const SectionState({
    this.status = SectionStatus.initial,
    this.items = const <Never>[],
    this.errorMessage,
  });
  final SectionStatus status;
  final List<T> items;
  final String? errorMessage;

  SectionState<T> copyWith({
    final SectionStatus? status,
    final List<T>? items,
    final String? errorMessage,
  }) => SectionState<T>(
    status: status ?? this.status,
    items: items ?? this.items,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  bool get isLoading => status == SectionStatus.loading;

  bool get isLoaded => status == SectionStatus.loaded;

  bool get hasError => status == SectionStatus.error;

  bool get isEmpty => items.isEmpty;

  @override
  List<Object?> get props => <Object?>[status, items, errorMessage];
}
