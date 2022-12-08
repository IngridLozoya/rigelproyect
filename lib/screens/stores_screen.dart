import 'package:flutter/material.dart';
import '../helpers/stores_service.dart';
import '../widgets/storesCard_widget.dart';
import 'cart_screen.dart';
import 'loading_screen.dart';
import 'package:provider/provider.dart';


class Stores_Screen extends StatelessWidget {
  const Stores_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storesService = Provider.of<StoresService>(context);

    if (storesService.isLoading) {
      return LoadingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Stores'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> const Cart_Screen()));
            },
            icon: const Icon(Icons.shopping_bag_outlined))
        ],
            ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) => GestureDetector(
          child: StoresCard(
            store: storesService.stores[index],
          )
        ),
        itemCount: storesService.stores.length,
      ),
    );
  }
}