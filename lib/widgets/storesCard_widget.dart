import 'package:flutter/material.dart';

import '../models/stores_model.dart';



class StoresCard extends StatelessWidget {

  final Stores store;

  const StoresCard({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 40, bottom: 40),
        width: double.infinity,
        height: 60,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _ProductDetails(name: store.name, city: store.city, country: store.country,),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    // ignore: prefer_const_literals_to_create_immutables
    boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 10,
      )
    ]
  );

}
class _ProductDetails extends StatelessWidget {
  final String country;
  final String city;
  final String name;


  const _ProductDetails({ required this.name, required this.city, required this.country});

  @override
  Widget build(BuildContext context) {
    TextStyle style1 = const TextStyle( fontSize: 16, color: Color(0xFF595758), fontWeight: FontWeight.bold);
    TextStyle style2 = const TextStyle( fontSize: 12, color: Color(0xFF595758), fontWeight: FontWeight.bold);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name, 
            style: style1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            city, 
            style: style2,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            country, 
            style: style2,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      )
    );
  }
}

