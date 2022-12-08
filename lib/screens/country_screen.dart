import 'package:flutter/material.dart';
import '../helpers/countries_service.dart';
import '../widgets/countrycard_widget.dart';
import 'cart_screen.dart';
import 'loading_screen.dart';
import 'package:provider/provider.dart';


class Countries_Screen extends StatelessWidget {
  const Countries_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countriesService = Provider.of<CountriesService>(context);

    if (countriesService.isLoading) {
      return LoadingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Countries'),
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
          child: CountryCard(
            country: countriesService.countries[index],
          ),
          onTap: () => Navigator.pushNamed(context, 'currency'),
          onLongPress: () => Navigator.pushNamed(context, 'stores'),
        ),
        itemCount: countriesService.countries.length,
      ),
    );
  }
}

