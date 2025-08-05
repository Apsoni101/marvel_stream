part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class FetchCharacterLists extends CharactersEvent {
  const FetchCharacterLists({this.limitPerList = 8});

  final int limitPerList;

  @override
  List<Object?> get props => <Object?>[limitPerList];
}

class RefreshCharacterLists extends CharactersEvent {}

// Individual section events
class FetchFeaturedCharacters extends CharactersEvent {
  const FetchFeaturedCharacters({this.limit = 8});

  final int limit;

  @override
  List<Object?> get props => <Object?>[limit];
}

class FetchAToZCharacters extends CharactersEvent {
  const FetchAToZCharacters({this.limit = 8});

  final int limit;

  @override
  List<Object?> get props => <Object?>[limit];
}

class FetchZToACharacters extends CharactersEvent {
  const FetchZToACharacters({this.limit = 8});

  final int limit;

  @override
  List<Object?> get props => <Object?>[limit];
}

class FetchClassicCharacters extends CharactersEvent {
  const FetchClassicCharacters({this.limit = 8});

  final int limit;

  @override
  List<Object?> get props => <Object?>[limit];
}

class FetchAvengersCharacters extends CharactersEvent {
  const FetchAvengersCharacters({this.limit = 8});

  final int limit;

  @override
  List<Object?> get props => <Object?>[limit];
}

class FetchSpiderVerseCharacters extends CharactersEvent {
  const FetchSpiderVerseCharacters({this.limit = 8});

  final int limit;

  @override
  List<Object?> get props => <Object?>[limit];
}

class FetchXMenCharacters extends CharactersEvent {
  const FetchXMenCharacters({this.limit = 8});

  final int limit;

  @override
  List<Object?> get props => <Object?>[limit];
}

class FetchHulkCharacters extends CharactersEvent {
  const FetchHulkCharacters({this.limit = 8});

  final int limit;

  @override
  List<Object?> get props => <Object?>[limit];
}

class FetchGuardiansCharacters extends CharactersEvent {
  const FetchGuardiansCharacters({this.limit = 8});

  final int limit;

  @override
  List<Object?> get props => <Object?>[limit];
}
