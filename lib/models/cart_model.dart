
class Cart {
  final int? id;
  final int cant;
  final String title;
  final String price;
  final String? image;

  Cart({
    required this.id,
    required this.cant,
    required this.title,
    required this.price,
    this.image
  });

  factory Cart.fromMap(Map<String, dynamic>json) => Cart(
    id:  json["id"],
    cant: json["cant"],
    title: json["title"],
    price: json["price"],
    image: json["image"]
  );

  Map<String, dynamic>toMap(){
    return{
      'id': id,
      'cant': cant,
      'race': title,
      'price': price,
      'image': image
    };
  }

} 