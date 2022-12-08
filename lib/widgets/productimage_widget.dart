import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 250,
        child: const ClipRRect (
          child: FadeInImage(
            image: AssetImage('assets/descarga.jpg') ,
            placeholder: AssetImage('assets/descarga.jpg') ,
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.amber,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 5)
      )
    ]
  );

}