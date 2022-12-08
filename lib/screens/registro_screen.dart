import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:rigelproyect/screens/product_gallery_screen.dart';
import '../helpers/productdatabase_helper.dart';
import '../helpers/takepicture_helper.dart';
import '../models/products_model.dart';
import '../ui/input_decorations.dart';
import '../widgets/productimage_widget.dart';


class RegiScreen extends StatefulWidget {
  final String? imagePath;
  RegiScreen({Key? key, this.imagePath}) : super(key: key);

  @override
  State<RegiScreen> createState() => _RegiScreenState();
}

class _RegiScreenState extends State<RegiScreen> {

imagepath(RegiScreen im) => im.imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(),
                Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>Product_galeryScreen())),
                    icon: Icon(Icons.arrow_back_ios_new, size: 30, color: Colors.white)
                  )
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      final cameras = await availableCameras();
                final firstCamera = cameras.first;
                if(!mounted) return;
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> TakenPicture(
                      camera: firstCamera,
                      )
                  )
                );
                    },
                    icon: Icon(Icons.camera_alt_outlined, size: 30, color: Colors.white)
                  )
                ),

              ],
            ),
             _ProductForm(),
              SizedBox(
                  height: 200,
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () async {
          DatabaseHelper.instance.addProduct(Product(
                    title: _ProductForm().textControllerTitle.text,
                    price: _ProductForm().textControllerPrice.text,
                    description: _ProductForm().textControllerDescription.text,
                    ranking: _ProductForm().textControllerRanking.text,
                    category: _ProductForm().textControllerCategoria.text,
                    calories: _ProductForm().textControllerCalorias.text,
                    aditives: _ProductForm().textControllerAditivos.text,
                    vitamins: _ProductForm().textControllerVitaminas.text,
                    image: imagepath.toString()
                  ));
          Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>Product_galeryScreen()));
        },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  final textControllerTitle = TextEditingController();
  final textControllerDescription = TextEditingController();
  final textControllerRanking = TextEditingController();
  final textControllerCategoria = TextEditingController();
  final textControllerCalorias = TextEditingController();
  final textControllerAditivos = TextEditingController();
  final textControllerVitaminas = TextEditingController();
 TextEditingController textControllerPrice = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox( height: 10 ),
              TextFormField(
                controller: textControllerTitle,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Product name', 
                  labelText: 'Name:'
                ),
              ),
              SizedBox( height: 10),

              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                controller: textControllerPrice,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', 
                  labelText: 'Price:'
                ),
              ),
              SizedBox( height: 10),

              TextFormField(
                controller: textControllerDescription,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Product description', 
                  labelText: 'Description:'
                ),
              ),
              SizedBox( height: 10),

              TextFormField(
                controller: textControllerCategoria,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Product category', 
                  labelText: 'Category:'
                ),
              ),
              SizedBox( height: 10),

              TextFormField(
                controller: textControllerRanking,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Product rank', 
                  labelText: 'Rank:'
                ),
              ),
              SizedBox( height: 10),

              TextFormField(
                controller: textControllerCalorias,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Product calories', 
                  labelText: 'Calories:'
                ),
              ),
              SizedBox( height: 10),

              TextFormField(
                controller: textControllerAditivos,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Product aditives', 
                  labelText: 'Aditives:'
                ),
              ),
              SizedBox( height: 10),

              TextFormField(
                controller: textControllerVitaminas,
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Product vitamins', 
                  labelText: 'Vitamins:'
                ),
              ),
              SizedBox( height: 10),
            ],
          ),
        ),
        
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.amber,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0, 5),
        blurRadius: 5
      )
    ]
  );

}