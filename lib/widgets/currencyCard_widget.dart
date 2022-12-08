import 'package:flutter/material.dart';
import '../models/countries_model.dart';
import '../models/currency_model.dart';



class CurrencyCard extends StatelessWidget {

  final Currencies currency;

  const CurrencyCard({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 40, bottom: 40),
        width: double.infinity,
        height: 300,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage( currency.image),
            _ProductDetails(name: currency.name),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    // ignore: prefer_const_literals_to_create_immutables
    boxShadow: [
      const BoxShadow(
        color: Colors.black54,
        blurRadius: 10,
        offset: Offset(0,7)
      )
    ]
  );

}
class _ProductDetails extends StatelessWidget {

  final String name;

  const _ProductDetails({ required this.name});

  @override
  Widget build(BuildContext context) {
    TextStyle style1 = const TextStyle( fontSize: 16, color: Color(0xFF595758), fontWeight: FontWeight.bold);
    TextStyle style2 = const TextStyle( fontSize: 12, color: Color(0xFF595758), fontWeight: FontWeight.bold);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      width: double.infinity,
      height: 60,
      color: const Color.fromARGB(255, 236, 161, 47),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name, 
            style: style1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      )
    );
  }
}

class _BackgroundImage extends StatelessWidget {

  final String? url;

  const _BackgroundImage(this.url); 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: url == null
      ? const Image(image: AssetImage('assets/descarga.png'))
      : FadeInImage(
        placeholder: const AssetImage('assets/descarga.png'),
        image: NetworkImage(url!),
        fit: BoxFit.cover
      ),
    );
  }
}