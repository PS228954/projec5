import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    List<Network> networks;

    Post({
        required this.networks,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        networks: List<Network>.from(json["networks"].map((x) => Network.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
    };
}

class Network {
    List<String> company;
    String href;
    String id;
    Location location;
    String name;
    String? source;

    Network({
        required this.company,
        required this.href,
        required this.id,
        required this.location,
        required this.name,
        this.source,
    });

    factory Network.fromJson(Map<String, dynamic> json) => Network(
        company: List<String>.from(json["company"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        location: Location.fromJson(json["location"]),
        name: json["name"],
        source: json["source"],
    );

    Map<String, dynamic> toJson() => {
        "company": List<dynamic>.from(company.map((x) => x)),
        "href": href,
        "id": id,
        "location": location.toJson(),
        "name": name,
        "source": source,
    };
}

class Location {
    String city;
    String country;
    double latitude;
    double longitude;

    Location({
        required this.city,
        required this.country,
        required this.latitude,
        required this.longitude,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json["city"],
        country: json["country"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
    };
}
