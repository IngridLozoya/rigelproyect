import 'dart:convert';
import 'dart:ffi';

class Stores {
    Stores({
        required this.name,
        required this.country,
        required this.city,
        required this.favorite
    });

    String name;
    String country;
    String city;
    String? id;
    bool? favorite;

    factory Stores.fromJson(String str) => Stores.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Stores.fromMap(Map<String, dynamic> json) => Stores(
        name: json["name"],
        country: json["country"],
        city: json["city"],
        favorite: json["favorite"],
    );
 
    Map<String, dynamic> toMap() => {
        "name": name,
        "country": country,
        "city": city,
        "favorite": favorite
    };
}