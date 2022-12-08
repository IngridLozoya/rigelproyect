
class Reserve {
  final int? id;
  final int cant;
  final String title;
  final String price;
  final String? image;

  Reserve({
    required this.id,
    required this.cant,
    required this.title,
    required this.price,
    this.image
  });

  factory Reserve.fromMap(Map<String, dynamic>json) => Reserve(
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