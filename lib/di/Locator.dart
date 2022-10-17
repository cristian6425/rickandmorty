
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/data/repositories/character/http_character_repository.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/data/repositories/episode/http_episode_repository.dart';
import 'package:rickandmorty/data/repositories/location/http_location_repository.dart';
import 'package:rickandmorty/domain/repositories/abstract_character_repository.dart';
import 'package:rickandmorty/domain/repositories/abstract_episode_repository.dart';
import 'package:rickandmorty/domain/repositories/abstract_location_repository.dart';

final getIt = GetIt.I;

Future<void> initializeDI()  async {
   _data();
}

void _data()  {

  getIt.registerSingleton(http.Client());

  getIt.registerSingleton<AbstractCharacterRepository>(HttpCharacterRepository(getIt.get()));
  getIt.registerSingleton<AbstractEpisodeRepository>(HttpEpisodeRepository(getIt.get()));
  getIt.registerSingleton<AbstractLocationRepository>(HttpLocationRepository(getIt.get()));
}

