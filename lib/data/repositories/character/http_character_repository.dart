import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:rickandmorty/data/services/internetValidator.dart';
import 'package:rickandmorty/domain/entities/Character.dart';
import 'package:rickandmorty/domain/entities/PostCharacter.dart';
import 'package:rickandmorty/domain/repositories/abstract_character_repository.dart';

class HttpCharacterRepository extends AbstractCharacterRepository {
  final Client client;

   String url= "https://rickandmortyapi.com/api/character";

  HttpCharacterRepository(this.client);

  @override
  Future<PostCharacter> getCharacters() async {
    await internetValidator();
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PostCharacter.fromJson(jsonDecode(response.body));
    }
    return throw Exception('Error buscando los personajes');
  }


  @override
  Future<PostCharacter> getNextCharacters(String url) async {
    await internetValidator();
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PostCharacter.fromJson(jsonDecode(response.body));
    }
    return throw Exception('Error buscando los personajes');
  }
}
