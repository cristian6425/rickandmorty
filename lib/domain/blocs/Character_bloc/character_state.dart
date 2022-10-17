part of 'character_bloc.dart';

enum PostStatus { initial, success, failure }

class CharacterState extends Equatable {
  final PostStatus status;
  final Info? info;
  final List<Character> characters;
  final bool hasReachedMax;
  final bool loading;
  final int episodeCuantity;
  final String locationWithMoreCharacters;
  final String errorMessage;

  const CharacterState(
      {this.status = PostStatus.initial,
      this.info,
      this.characters = const <Character>[],
      this.hasReachedMax = false,
      this.loading = false,
      this.episodeCuantity = 0,
      this.locationWithMoreCharacters = "",
      this.errorMessage=""});

  CharacterState copyWith(
      {PostStatus? status,
      Info? info,
      List<Character>? character,
      bool? hasReachedMax,
      bool? loading,
      bool? failure,
      int? episodeCuantity,
      String? locationWithMoreCharacters,
      String? errorMessage
      }) {
    return CharacterState(
        status: status ?? this.status,
        info: info ?? this.info,
        characters: character ?? this.characters,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        loading: loading ?? this.loading,
        episodeCuantity: episodeCuantity ?? this.episodeCuantity,
        locationWithMoreCharacters:
            locationWithMoreCharacters ?? this.locationWithMoreCharacters,errorMessage: errorMessage??"");
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${characters.length} , loading ${loading.toString()}, ''';
  }

  @override
  List<Object> get props =>
      [status, characters, hasReachedMax, info ?? "", loading,locationWithMoreCharacters, episodeCuantity,errorMessage];
}
