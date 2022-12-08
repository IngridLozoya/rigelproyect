import 'dart:convert';
import 'dart:ffi';

class Countries {
    Countries({
        required this.name,
        required this.flag,
        required this.currency,
        required this.stores
    });

    String name;
    String flag;
    String currency;
    String? id;
    int? stores;

    factory Countries.fromJson(String str) => Countries.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Countries.fromMap(Map<String, dynamic> json) => Countries(
        name: json["name"],
        flag: json["flag"],
        currency: json["currency"],
        stores: json["stores"],
    );
 
    Map<String, dynamic> toMap() => {
        "name": name,
        "flag": flag,
        "currency": currency,
        "stores": stores
    };
}