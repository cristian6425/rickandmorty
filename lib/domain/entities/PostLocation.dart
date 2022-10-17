import 'package:rickandmorty/domain/entities/Location.dart';
import 'dart:convert';

import 'package:rickandmorty/domain/entities/PostInfo.dart';

PostLocation postLocationFromJson(String str) => PostLocation.fromJson(json.decode(str));

class PostLocation {
  PostLocation({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<Location> results;

  factory PostLocation.fromJson(Map<String, dynamic> json) => PostLocation(
    info: Info.fromJson(json["info"]),
    results: List<Location>.from(json["results"].map((x) => Location.fromJson(x))),
  );

}
