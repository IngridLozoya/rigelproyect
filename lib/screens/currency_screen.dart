import 'package:flutter/material.dart';
import '../helpers/currency_service.dart';
import '../widgets/currencyCard_widget.dart';
import 'cart_screen.dart';
import 'loading_screen.dart';
import 'package:provider/provider.dart';


class Currency_Screen extends StatelessWidget {
  const Currency_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyService = Provider.of<CurrencyService>(context);

    if (currencyService.isLoading) {
      return LoadingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Currency'),
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
          child: CurrencyCard(
            currency: currencyService.currency[index],
          ),
          onTap: () => Navigator.pushNamed(context, 'stores'),
        ),
        itemCount: currencyService.currency.length,
      ),
    );
  }
}