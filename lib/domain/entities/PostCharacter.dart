
import 'dart:convert';

import 'package:rickandmorty/domain/entities/Character.dart';
import 'package:rickandmorty/domain/entities/PostInfo.dart';

PostCharacter characterFromJson(String str) => PostCharacter.fromJson(json.decode(str));

class PostCharacter {
  PostCharacter({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<Character> results;

  factory PostCharacter.fromJson(Map<String, dynamic> json) => PostCharacter(
    info: Info.fromJson(json["info"]),
    results: List<Character>.from(json["results"].map((x) => Character.fromJson(x))),
  );

}
