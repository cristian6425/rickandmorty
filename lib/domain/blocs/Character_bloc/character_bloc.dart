import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/domain/entities/Character.dart';
import 'package:rickandmorty/domain/entities/PostInfo.dart';
import 'package:rickandmorty/domain/repositories/abstract_character_repository.dart';
import 'package:rickandmorty/domain/repositories/abstract_episode_repository.dart';
import 'package:rickandmorty/domain/repositories/abstract_location_repository.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final AbstractCharacterRepository characterRepository;
  final AbstractEpisodeRepository episodeRepository;
  final AbstractLocationRepository locationRepository;
  String url = "https://rickandmortyapi.com/api/character";

  CharacterBloc(
      this.characterRepository, this.episodeRepository, this.locationRepository)
      : super(CharacterState()) {
    on<InitialState>(_initialState);
    on<CharacterEvent>(_refreshListCharacters);
  }

  Future<void> _initialState(
      CharacterEvent event, Emitter<CharacterState> emit) async {
    if (state.loading) return;
    emit(state.copyWith(loading: true));
    try {
      int episodesCuantity = await episodeRepository.getEpisodesCuantity();
      String locationWithMoreCharacters =
          await locationRepository.getLocationsWithMoreCharacter();
      emit(state.copyWith(
          episodeCuantity: episodesCuantity,
          locationWithMoreCharacters: locationWithMoreCharacters));
      if (state.status == PostStatus.initial) {
        final posts = await characterRepository.getCharacters();
        return emit(state.copyWith(
            status: PostStatus.success,
            character: posts.results,
            info: posts.info,
            hasReachedMax: false,
            loading: false));
      }
    } catch (e) {
      emit(state.copyWith(
          status: PostStatus.failure,
          loading: false,
          errorMessage: e.toString()));
    }
  }

  Future<void> _refreshListCharacters(
      CharacterEvent event, Emitter<CharacterState> emit) async {
    if (state.hasReachedMax) return;
    if (state.loading) return;
    emit(state.copyWith(loading: true));
    try {
      if (state.info!.next != "") {
        final posts =
            await characterRepository.getNextCharacters(state.info!.next);
        emit(posts.results.isEmpty
            ? state.copyWith(hasReachedMax: true, loading: false)
            : state.copyWith(
                status: PostStatus.success,
                character: List.of(state.characters)..addAll(posts.results),
                hasReachedMax: false,
                info: posts.info,
                loading: false));
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(
          status: PostStatus.failure,
          loading: false,
          errorMessage: e.toString()));
    }
  }
}
