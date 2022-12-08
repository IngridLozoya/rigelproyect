import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rigelproyect/screens/product_detail_screen.dart';
import 'package:rigelproyect/screens/registro_screen.dart';
import 'package:rigelproyect/screens/stores_screen.dart';
import '../helpers/productdatabase_helper.dart';
import '../models/products_model.dart';
import '../widgets/cardcontainer_widget.dart';
import 'cart_screen.dart';
import 'country_screen.dart';
import 'currency_screen.dart';

class Product_galeryScreen extends StatefulWidget {
  Product_galeryScreen({Key? key}) : super(key: key);

  @override
  State<Product_galeryScreen> createState() => _Product_galeryScreenState();
}

class _Product_galeryScreenState extends State<Product_galeryScreen> {
  int? prodId;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Rigel', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> const Cart_Screen()));
            },
            icon: const Icon(Icons.shopping_bag_outlined))
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
    ),
    drawer: Drawer(
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber
              ),
              child: Text('More', style: TextStyle(color: Colors.black),),
            ),
            ListTile(
              title: const Text('Countries'),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: ((context) => Countries_Screen()));
                Navigator.push(context, route);
              },
            ),
            ListTile(
              title: const Text('Currency'),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: ((context) => Currency_Screen()));
                Navigator.push(context, route);
              },
            ),
            ListTile(
              title: const Text('Stores'),
              onTap: () {
                final route = MaterialPageRoute(
                    builder: ((context) => Stores_Screen()));
                Navigator.push(context, route);
              },
            ),
            ],
        ),
        ),
    body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Center(
              child: (
                FutureBuilder<List<Product>>(
                  future: DatabaseHelper.instance.getProduct(),
                  builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot){
                    if(!snapshot.hasData){
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: const Text('Loading...'),
                        ),
                      );
                    }
                    else {
                      return snapshot.data!.isEmpty
                      ?Center(
                        child: Container(
                          child: const Text('No products'))
                          )
                      : ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.map((products){
                          return Center(
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                            child: CardContainer(
                                              child: ListTile(
                                                //leading: Image(image: FileImage(File(products.image))),
                                                title: Text(
                                                    'product: ${products.title}', style: TextStyle(color: Colors.black),),
                                                onLongPress: () {
                                                  DatabaseHelper.instance.deleteProduct(products.id!);
                                                  },
                                                  onTap: (){
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(prodId:prodId)));
                                                  },
                                              ),
                                            )
                                      )
                                  ],
                                ),
                              ]),
                              );
                        }
                      ).toList());
                    }
                  },
                )
              ),
            ),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> RegiScreen()));
              })
            ],
          ),
        ),
    ),
     );
  }
}