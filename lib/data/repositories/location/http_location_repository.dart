import 'dart:convert';

import 'package:http/http.dart';
import 'package:rickandmorty/data/services/internetValidator.dart';
import 'package:rickandmorty/domain/entities/PostLocation.dart';
import 'package:rickandmorty/domain/repositories/abstract_location_repository.dart';

class HttpLocationRepository extends AbstractLocationRepository {
  final Client client;
  String url = "https://rickandmortyapi.com/api/location";

  HttpLocationRepository(this.client);

  @override
  Future<String> getLocationsWithMoreCharacter() async {
    await internetValidator();
    final response = await client.get(Uri.parse(url));
    String majorName = "";
    if (response.statusCode == 200) {
      PostLocation post = PostLocation.fromJson(jsonDecode(response.body));
      int major = 0;
      for (int page = 1; page <= post.info.pages; page++) {
        final response = await client.get(Uri.parse("$url?page=$page"));
        PostLocation subpost = PostLocation.fromJson(jsonDecode(response.body));
        subpost.results.forEach((element) {
          if (element.residents.length > major) {
            major = element.residents.length;
            majorName = element.name;
            print(element.name);
          }
        });
      }
      return majorName;
    }
    return throw Exception('Error buscando las ubicaciones');
  }
}
