import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rigelproyect/screens/product_gallery_screen.dart';
import '../helpers/productdatabase_helper.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../models/reserve_model.dart';
import '../widgets/cardcontainer_widget.dart';


class ProductDetail extends StatefulWidget {
  int? prodId;
   ProductDetail({Key? key, this.prodId}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> 
with TickerProviderStateMixin{
  int? prodId;
  int? countControllerValue;
  double? ratingBarValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
                    builder: (context)=> Product_galeryScreen()));
            },
            icon: const Icon(Icons.arrow_back))
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                child: 
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
                    } else {
                      return snapshot.data!.isEmpty
                      ?Center(
                        child: Container(
                        child: const Text('No product'))
                      ) : ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.map((products){
                          return Column(
                            children: [
                              CardContainer(
                                child: Image(
                                          image: FileImage(File(products.image!)),
                                          width: MediaQuery.of(context).size.width,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                CardContainer(
                                          child: AutoSizeText(
                                            'product: ${products.title}',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.getFont(
                                              'Lexend Deca',
                                              color: const Color(0xFF090F13),
                                              fontWeight: FontWeight.w100,
                                              fontSize: 40,
                                            ),
                                          ),
                                  ),
                                CardContainer(
                                  child: AutoSizeText(
                                    'Description: ${products.description}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                CardContainer(
                                  child: AutoSizeText(
                                    'Rank: ${products.ranking}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                CardContainer(
                                  child: AutoSizeText(
                                    'Category: ${products.category}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                         Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                child: Text(
                                                  'Calories',
                                                  style:
                                                    TextStyle(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF95A1AC),
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.normal,
                                                      ),
                                                  ),
                                              ),
                                            Text(
                                              products.calories,
                                              style:const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                              child: Text(
                                                'Aditives',
                                                style:
                                                  TextStyle(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF95A1AC),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal,
                                                    ),
                                                ),
                                              ),
                                            Text(
                                              products.aditives,
                                              style: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            'Vitamins',
                            style:
                                TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                          Text(
                          products.vitamins,
                          style: const TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF020101),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.7, 0.8),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                          child: Container(
                            width: 160,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: const Color(0xFF9E9E9E),
                                width: 1,
                              ),
                            ),
                            child: FlutterFlowCountController(
                              decrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.minus,
                                color: enabled
                                    ? const Color(0xDD000000)
                                    : const Color(0xFFEEEEEE),
                                size: 20,
                              ),
                              incrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.plus,
                                color: enabled ? Colors.blue : const Color(0xFFEEEEEE),
                                size: 20,
                              ),
                              countBuilder: (count) => Text(
                                count.toString(),
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              count: countControllerValue ??= 0,
                              updateCount: (count) =>
                                  setState(() => countControllerValue = count),
                              stepSize: 1,
                            ),
                          ),
                        ),
                      ),
                      _subtotal(price: products.price.hashCode, cant: countControllerValue.hashCode),
                      Align(
                        alignment: const AlignmentDirectional(-0.6, 1),
                        child: ElevatedButton(
                          onPressed: () {
                            DatabaseHelper.instance.addtoCart(Cart(
                              id: prodId, 
                              cant: countControllerValue.hashCode, 
                              title: products.title, 
                              price: (products.price.hashCode * countControllerValue.hashCode).toString()
                              ));
                          },
                          child: const Text('Add '),
                        ),
                      ),
                      Align(
                        child: ElevatedButton(
                          onPressed: () {
                            DatabaseHelper.instance.addtoReserve(Reserve(
                              id: prodId, 
                              cant: countControllerValue.hashCode,
                              title: products.title, 
                              price: (products.price.hashCode * countControllerValue.hashCode).toString()
                              ));
                          },
                          child:  const Text('Reserve') ),
                      )
                    ],
                  ),
                ),
              )
                      ],
                    )
                  ],
                ),
              ),

                            ],
                          );
                        }).toList());
  }})
              )
          ])
      )
    )
                );
  }
                      
  // ignore: non_constant_identifier_names
  FlutterFlowCountController({required FaIcon Function(dynamic enabled) decrementIconBuilder, required FaIcon Function(dynamic enabled) incrementIconBuilder, required Text Function(dynamic count) countBuilder, required int count, required void Function(dynamic count) updateCount, required int stepSize}) {}
}

class _subtotal extends StatelessWidget {
  final int cant;
  final int price;
   const _subtotal({Key? key, required this.price, required this.cant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sub = cant * price;
    return Align(
                        alignment:  const AlignmentDirectional(-0.5, -0.25),
                        child: Text(
                          sub.toString()
                        ))
                          ;
  }
}


