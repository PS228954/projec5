// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  DateTime date;
  String localName;
  String name;
  CountryCode countryCode;
  bool fixed;
  bool global;
  dynamic counties;
  int? launchYear;
  List<Type> types;

  Post({
    required this.date,
    required this.localName,
    required this.name,
    required this.countryCode,
    required this.fixed,
    required this.global,
    this.counties,
    this.launchYear,
    required this.types,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    date: DateTime.parse(json["date"]),
    localName: json["localName"],
    name: json["name"],
    countryCode: countryCodeValues.map[json["countryCode"]]!,
    fixed: json["fixed"],
    global: json["global"],
    counties: json["counties"],
    launchYear: json["launchYear"],
    types: List<Type>.from(json["types"].map((x) => typeValues.map[x]!)),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "localName": localName,
    "name": name,
    "countryCode": countryCodeValues.reverse[countryCode],
    "fixed": fixed,
    "global": global,
    "counties": counties,
    "launchYear": launchYear,
    "types": List<dynamic>.from(types.map((x) => typeValues.reverse[x])),
  };
}

enum CountryCode { AT }

final countryCodeValues = EnumValues({
  "AT": CountryCode.AT
});

enum Type { PUBLIC }

final typeValues = EnumValues({
  "Public": Type.PUBLIC
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
