
import 'dart:convert';

import 'package:rickandmorty/domain/entities/Character.dart';
import 'package:rickandmorty/domain/entities/PostInfo.dart';

PostEpisode EpisodeFromJson(String str) => PostEpisode.fromJson(json.decode(str));

class PostEpisode {
  PostEpisode({
    required this.info
  });

  final Info info;

  factory PostEpisode.fromJson(Map<String, dynamic> json) => PostEpisode(
    info: Info.fromJson(json["info"]),

  );

}
