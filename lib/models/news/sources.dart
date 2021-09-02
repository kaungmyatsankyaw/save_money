// To parse this JSON data, do
//
//     final sourceModel = sourceModelFromJson(jsonString);

import 'dart:convert';

SourceModel sourceModelFromJson(String str) =>
    SourceModel.fromJson(json.decode(str));

String sourceModelToJson(SourceModel data) => json.encode(data.toJson());

class SourceModel {
  SourceModel({
    required this.status,
    required this.sources,
  });

  String status;
  List<Source> sources;

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        status: json["status"],
        sources:
            List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
      };
}

class Source {
  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.language,
    required this.country,
  });

  String id;
  String name;
  String description;
  String url;

  String language;
  String country;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        language: json["language"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "language": language,
        "country": country,
      };
}

enum Category {
  GENERAL,
  BUSINESS,
  TECHNOLOGY,
  SPORTS,
  ENTERTAINMENT,
  HEALTH,
  SCIENCE
}

final categoryValues = EnumValues({
  "business": Category.BUSINESS,
  "entertainment": Category.ENTERTAINMENT,
  "general": Category.GENERAL,
  "health": Category.HEALTH,
  "science": Category.SCIENCE,
  "sports": Category.SPORTS,
  "technology": Category.TECHNOLOGY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    // ignore: unnecessary_null_comparison
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
