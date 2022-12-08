import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rigelproyect/screens/product_gallery_screen.dart';
import '../helpers/productdatabase_helper.dart';
import '../models/cart_model.dart';
import '../models/reserve_model.dart';
import 'cart_screen.dart';

class Reserve_Screen extends StatefulWidget {
  const Reserve_Screen({Key? key}) : super(key: key);

  @override
  _Reserve_Screen createState() => _Reserve_Screen();
}

class _Reserve_Screen extends State<Reserve_Screen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 24,
          ),
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Product_galeryScreen()));
          },
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Reserve>>(
                  future: DatabaseHelper.instance.getReserve(),
                  builder: (BuildContext context, AsyncSnapshot<List<Reserve>> snapshot){
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
                          child: const Text('No products reserved'))
                          )
                      : ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data!.map((reserve){
                          return Column(
                            children: [
                               SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                            blurRadius: 3,
                            color: Color(0x3600000F),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color: Colors.white,
                          width: 0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Card(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: const Color(0xFFF1F4F8),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2, 2, 2, 2),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              'assets/descarga.jpg',
                                              width: 90,
                                              height: 90,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [                                        
                                         Text(
                                          'Product Name: ${reserve.title}',
                                          style: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Text(
                                          'Cant: ${reserve.cant}',
                                          style: const TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  'Total: ${reserve.price}' ,
                                  style: const TextStyle(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF090F13),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline_rounded,
                                    color: Color(0xFFE62424),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    DatabaseHelper.instance.deletefromReserve(reserve.id!);
                                  },
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                

                ElevatedButton(
                  onPressed: () async {
                    DatabaseHelper.instance.addtoCart(Cart(
                              id: reserve.id, 
                              cant: reserve.cant, 
                              title: reserve.title, 
                              price: reserve.price
                              ));
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Cart_Screen()));
                  },
                  child: const Text( 'Proceed to purchase',
                    style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,)
                          ),
                ),

              ],
            ),

          ),

        
                          ]);
                        }
                      ).toList());
                    }
                  },
                )
                )
    );
  }
}