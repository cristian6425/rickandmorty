part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class GetCharacters extends CharacterEvent{}
class InitialState extends CharacterEvent{}