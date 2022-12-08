import 'dart:convert';
import 'dart:ffi';

class Currencies {
    Currencies({
        required this.name,
        required this.image,

    });

    String name;
    String image;
    String? id;


    factory Currencies.fromJson(String str) => Currencies.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Currencies.fromMap(Map<String, dynamic> json) => Currencies(
        name: json["name"],
        image: json["image"],

    );
 
    Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,

    };
}