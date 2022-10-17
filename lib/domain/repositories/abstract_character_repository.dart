import 'package:rickandmorty/domain/entities/Character.dart';
import 'package:rickandmorty/domain/entities/PostCharacter.dart';

abstract class AbstractCharacterRepository {

  Future<PostCharacter> getCharacters();

  Future<PostCharacter> getNextCharacters(String url);
}