import 'dart:convert';
import 'package:http/http.dart';
import 'package:rickandmorty/data/services/internetValidator.dart';
import 'package:rickandmorty/domain/entities/PostEpisode.dart';
import 'package:rickandmorty/domain/repositories/abstract_episode_repository.dart';

class HttpEpisodeRepository extends AbstractEpisodeRepository {
  final Client client;

  String url = "https://rickandmortyapi.com/api/episode";

  HttpEpisodeRepository(this.client);

  @override
  Future<int> getEpisodesCuantity() async {
   await internetValidator();
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      PostEpisode post = PostEpisode.fromJson(jsonDecode(response.body));
      return post.info.count;
    }
    return throw Exception('Error buscando los episodios');
  }
}

