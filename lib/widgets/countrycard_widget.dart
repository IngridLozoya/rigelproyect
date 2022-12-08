import 'package:flutter/material.dart';
import '../models/countries_model.dart';



class CountryCard extends StatelessWidget {

  final Countries country;

  const CountryCard({Key? key, required this.country}) : super(key: key);

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
            _BackgroundImage( country.flag ),
            _ProductDetails(name: country.name, stores: country.stores,),
            Positioned(
              top: 0,
              right: 0,
              child: _CurrencyTag(currency: country.currency,)
            )
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

class _CurrencyTag extends StatelessWidget {

  final String currency;

  const _CurrencyTag({required this.currency});

   @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: FittedBox(
        child: Text('\$$currency', style: const TextStyle(color: Color(0xFF595758), fontSize: 20, fontWeight: FontWeight.bold),)
      ),
      width: 100,
      height: 40,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 236, 161, 47)
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {

  final String name;
  final int? stores;

  const _ProductDetails({ required this.name, this.stores});

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
           Text(
             stores.toString(),
             style: style2,
             maxLines: 2,
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
      ? const Image(image: AssetImage('assets/image.png'))
      : FadeInImage(
        placeholder: const AssetImage('assets/dual-ball.gif'),
        image: NetworkImage(url!),
        fit: BoxFit.cover
      ),
    );
  }
}
