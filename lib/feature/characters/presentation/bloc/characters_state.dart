part of 'characters_bloc.dart';

@immutable
sealed class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object?> get props => <Object?>[];
}

final class CharactersInitial extends CharactersState {}

final class CharactersReady extends CharactersState {
  const CharactersReady({
    this.featuredCharacters = const  SectionState(),
    this.aToZCharacters = const SectionState(),
    this.classicCharacters = const SectionState(),
    this.avengersCharacters = const SectionState(),
    this.spiderVerseCharacters = const SectionState(),
    this.xMenCharacters = const SectionState(),
    this.hulkCharacters = const SectionState(),
    this.guardiansCharacters = const SectionState(),
  });

  final SectionState<CharacterEntity> featuredCharacters;
  final SectionState<CharacterEntity> aToZCharacters;
  final SectionState<CharacterEntity> classicCharacters;
  final SectionState<CharacterEntity> avengersCharacters;
  final SectionState<CharacterEntity> spiderVerseCharacters;
  final SectionState<CharacterEntity> xMenCharacters;
  final SectionState<CharacterEntity> hulkCharacters;
  final SectionState<CharacterEntity> guardiansCharacters;

  CharactersReady copyWith({
    final SectionState<CharacterEntity>? featuredCharacters,
    final SectionState<CharacterEntity>? aToZCharacters,
    final SectionState<CharacterEntity>? classicCharacters,
    final SectionState<CharacterEntity>? avengersCharacters,
    final SectionState<CharacterEntity>? spiderVerseCharacters,
    final SectionState<CharacterEntity>? xMenCharacters,
    final SectionState<CharacterEntity>? hulkCharacters,
    final SectionState<CharacterEntity>? guardiansCharacters,
  }) => CharactersReady(
    featuredCharacters: featuredCharacters ?? this.featuredCharacters,
    aToZCharacters: aToZCharacters ?? this.aToZCharacters,
    classicCharacters: classicCharacters ?? this.classicCharacters,
    avengersCharacters: avengersCharacters ?? this.avengersCharacters,
    spiderVerseCharacters: spiderVerseCharacters ?? this.spiderVerseCharacters,
    xMenCharacters: xMenCharacters ?? this.xMenCharacters,
    hulkCharacters: hulkCharacters ?? this.hulkCharacters,
    guardiansCharacters: guardiansCharacters ?? this.guardiansCharacters,
  );

  @override
  List<Object?> get props => <Object?>[
    featuredCharacters,
    aToZCharacters,
    classicCharacters,
    avengersCharacters,
    spiderVerseCharacters,
    xMenCharacters,
    hulkCharacters,
    guardiansCharacters,
  ];
}
