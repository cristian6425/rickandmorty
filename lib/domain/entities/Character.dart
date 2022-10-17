class Character {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationCharacter origin;
  final LocationCharacter location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"],
    type: json["type"],
    gender: json["gender"],
    origin: LocationCharacter.fromJson(json["origin"]),
    location: LocationCharacter.fromJson(json["location"]),
    image: json["image"],
    episode: List<String>.from(json["episode"].map((x) => x)),
    url: json["url"],
    created: DateTime.parse(json["created"]),
  );

}

class LocationCharacter {
  LocationCharacter({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory LocationCharacter.fromJson(Map<String, dynamic> json) => LocationCharacter(
    name: json["name"],
    url: json["url"],
  );

}

