import 'dart:ffi';

class Product {
  final int? id;
  final String? image;
  final String category;
  final String price;
  final String ranking;
  final String title;
  final String description;
  final String calories;
  final String aditives;
  final String vitamins;

  Product({
    this.id,
    this.image,
    required this.category,
    required this.price,
    required this.ranking,
    required this.title,
    required this.description,
    required this.calories,
    required this.aditives,
    required this.vitamins
  });

  factory Product.fromMap(Map<String, dynamic>json) => Product(
    id:  json['id'],
    image: json["image"],
    category: json['category'],
    price: json['price'],
    ranking: json['ranking'],
    title: json['title'],
    description: json['description'],
    calories: json['calories'],
    aditives: json['aditives'],
    vitamins: json['vitamins']
  );

  Map<String, dynamic>toMap(){
    return{
      'id': id,
      'image': image,
      'category': category,
      'price': price,
      'ranking': ranking,
      'title': title,
      'description': description,
      'calories': calories,
      'aditives': aditives,
      'vitamins': vitamins
    };
  }

} 