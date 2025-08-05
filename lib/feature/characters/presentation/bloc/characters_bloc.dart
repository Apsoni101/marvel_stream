import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_stream/core/enums/section_status.dart';
import 'package:marvel_stream/core/services/error/failure.dart';
import 'package:marvel_stream/feature/characters/domain/entities/character_entity.dart';
import 'package:marvel_stream/feature/characters/domain/entities/section_state.dart';
import 'package:marvel_stream/feature/characters/domain/use_cases/characters_usecase.dart';

part 'characters_event.dart';

part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({required this.charactersUseCase})
    : super(CharactersInitial()) {
    on<FetchCharacterLists>(_onFetchCharacterLists);
    on<RefreshCharacterLists>(_onRefreshCharacterLists);
    on<FetchFeaturedCharacters>(_onFetchFeaturedCharacters);
    on<FetchAToZCharacters>(_onFetchAToZCharacters);
    on<FetchClassicCharacters>(_onFetchClassicCharacters);
    on<FetchAvengersCharacters>(_onFetchAvengersCharacters);
    on<FetchSpiderVerseCharacters>(_onFetchSpiderVerseCharacters);
    on<FetchXMenCharacters>(_onFetchXMenCharacters);
    on<FetchHulkCharacters>(_onFetchHulkCharacters);
    on<FetchGuardiansCharacters>(_onFetchGuardiansCharacters);
  }

  final CharactersUseCase charactersUseCase;

  Future<void> _onFetchCharacterLists(
    final FetchCharacterLists event,
    final Emitter<CharactersState> emit,
  ) async {
    // Initialize with empty ready state
    const CharactersReady readyState = CharactersReady();
    emit(readyState);

    // Trigger all section loads independently
    add(FetchFeaturedCharacters(limit: event.limitPerList));
    add(const FetchAToZCharacters(limit: 100));
    add(FetchClassicCharacters(limit: event.limitPerList));
    add(FetchAvengersCharacters(limit: event.limitPerList));
    add(FetchSpiderVerseCharacters(limit: event.limitPerList));
    add(FetchXMenCharacters(limit: event.limitPerList));
    add(FetchHulkCharacters(limit: event.limitPerList));
    add(FetchGuardiansCharacters(limit: event.limitPerList));
  }

  Future<void> _onRefreshCharacterLists(
    final RefreshCharacterLists event,
    final Emitter<CharactersState> emit,
  ) async {
    add(const FetchCharacterLists());
  }

  CharactersReady _getReadyState() =>
      state is CharactersReady
          ? state as CharactersReady
          : const CharactersReady();

  Future<void> _onFetchFeaturedCharacters(
    final FetchFeaturedCharacters event,
    final Emitter<CharactersState> emit,
  ) async {
    final CharactersReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        featuredCharacters: currentState.featuredCharacters.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<CharacterEntity>> result =
        await charactersUseCase.getCharacters(
          limit: event.limit,
          orderBy: '-modified',
        );

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          featuredCharacters: currentState.featuredCharacters.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<CharacterEntity> characters) => emit(
        _getReadyState().copyWith(
          featuredCharacters: currentState.featuredCharacters.copyWith(
            status: SectionStatus.loaded,
            items: characters,
          ),
        ),
      ),
    );
  }

  Future<void> _onFetchAToZCharacters(
    final FetchAToZCharacters event,
    final Emitter<CharactersState> emit,
  ) async {
    final CharactersReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        aToZCharacters: currentState.aToZCharacters.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<CharacterEntity>> result =
        await charactersUseCase.getCharacters(
          limit: event.limit,
          orderBy: 'name',
        );

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          aToZCharacters: currentState.aToZCharacters.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<CharacterEntity> characters) => emit(
        _getReadyState().copyWith(
          aToZCharacters: currentState.aToZCharacters.copyWith(
            status: SectionStatus.loaded,
            items: characters,
          ),
        ),
      ),
    );
  }



  Future<void> _onFetchClassicCharacters(
    final FetchClassicCharacters event,
    final Emitter<CharactersState> emit,
  ) async {
    final CharactersReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        classicCharacters: currentState.classicCharacters.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<CharacterEntity>> result =
        await charactersUseCase.getCharacters(
          limit: event.limit,
          orderBy: 'modified',
        );

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          classicCharacters: currentState.classicCharacters.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<CharacterEntity> characters) => emit(
        _getReadyState().copyWith(
          classicCharacters: currentState.classicCharacters.copyWith(
            status: SectionStatus.loaded,
            items: characters,
          ),
        ),
      ),
    );
  }

  Future<void> _onFetchAvengersCharacters(
    final FetchAvengersCharacters event,
    final Emitter<CharactersState> emit,
  ) async {
    final CharactersReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        avengersCharacters: currentState.avengersCharacters.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<CharacterEntity>> result =
        await charactersUseCase.getCharacters(
          limit: 100,
          nameStartsWith: 'Aven',
        );

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          avengersCharacters: currentState.avengersCharacters.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<CharacterEntity> characters) => emit(
        _getReadyState().copyWith(
          avengersCharacters: currentState.avengersCharacters.copyWith(
            status: SectionStatus.loaded,
            items: characters,
          ),
        ),
      ),
    );
  }

  Future<void> _onFetchSpiderVerseCharacters(
    final FetchSpiderVerseCharacters event,
    final Emitter<CharactersState> emit,
  ) async {
    final CharactersReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        spiderVerseCharacters: currentState.spiderVerseCharacters.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<CharacterEntity>> result =
        await charactersUseCase.getCharacters(
          limit: event.limit,
          nameStartsWith: 'Spider',
        );

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          spiderVerseCharacters: currentState.spiderVerseCharacters.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<CharacterEntity> characters) => emit(
        _getReadyState().copyWith(
          spiderVerseCharacters: currentState.spiderVerseCharacters.copyWith(
            status: SectionStatus.loaded,
            items: characters,
          ),
        ),
      ),
    );
  }

  Future<void> _onFetchXMenCharacters(
    final FetchXMenCharacters event,
    final Emitter<CharactersState> emit,
  ) async {
    final CharactersReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        xMenCharacters: currentState.xMenCharacters.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<CharacterEntity>> result =
        await charactersUseCase.getCharacters(
          limit: event.limit,
          nameStartsWith: 'x',
        );

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          xMenCharacters: currentState.xMenCharacters.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<CharacterEntity> characters) => emit(
        _getReadyState().copyWith(
          xMenCharacters: currentState.xMenCharacters.copyWith(
            status: SectionStatus.loaded,
            items: characters,
          ),
        ),
      ),
    );
  }

  Future<void> _onFetchHulkCharacters(
    final FetchHulkCharacters event,
    final Emitter<CharactersState> emit,
  ) async {
    final CharactersReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        hulkCharacters: currentState.hulkCharacters.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<CharacterEntity>> result =
        await charactersUseCase.getCharacters(
          limit: event.limit,
          nameStartsWith: 'Hulk',
        );

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          hulkCharacters: currentState.hulkCharacters.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<CharacterEntity> characters) => emit(
        _getReadyState().copyWith(
          hulkCharacters: currentState.hulkCharacters.copyWith(
            status: SectionStatus.loaded,
            items: characters,
          ),
        ),
      ),
    );
  }

  Future<void> _onFetchGuardiansCharacters(
    final FetchGuardiansCharacters event,
    final Emitter<CharactersState> emit,
  ) async {
    final CharactersReady currentState = _getReadyState();
    emit(
      currentState.copyWith(
        guardiansCharacters: currentState.guardiansCharacters.copyWith(
          status: SectionStatus.loading,
        ),
      ),
    );

    final Either<Failure, List<CharacterEntity>> result =
        await charactersUseCase.getCharacters(
          limit: event.limit,
          nameStartsWith: 'Star',
        );

    result.fold(
      (final Failure failure) => emit(
        _getReadyState().copyWith(
          guardiansCharacters: currentState.guardiansCharacters.copyWith(
            status: SectionStatus.error,
            errorMessage: failure.message,
          ),
        ),
      ),
      (final List<CharacterEntity> characters) => emit(
        _getReadyState().copyWith(
          guardiansCharacters: currentState.guardiansCharacters.copyWith(
            status: SectionStatus.loaded,
            items: characters,
          ),
        ),
      ),
    );
  }
}
