import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigelproyect/screens/cart_screen.dart';
import 'package:rigelproyect/screens/country_screen.dart';
import 'package:rigelproyect/screens/currency_screen.dart';
import 'package:rigelproyect/screens/product_detail_screen.dart';
import 'package:rigelproyect/screens/product_gallery_screen.dart';
import 'package:rigelproyect/screens/registro_screen.dart';
import 'package:rigelproyect/screens/reserved_screen.dart';
import 'package:rigelproyect/screens/stores_screen.dart';
import 'helpers/countries_service.dart';
import 'helpers/currency_service.dart';
import 'helpers/stores_service.dart';


void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => CountriesService(), lazy: false),
        ChangeNotifierProvider(create: ( _ ) => CurrencyService(), lazy: false),
        ChangeNotifierProvider(create: ( _ ) => StoresService(), lazy: false),
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) {
          return Product_galeryScreen();
        },
        'registro': (context) {
          return RegiScreen();
        },
        'cart': (context) {
          return const Cart_Screen();
        },
        'details': (context) {
          return ProductDetail();
        },
        'countries': (context) {
          return const Countries_Screen();
        },
        'currency': (context) {
          return const Currency_Screen();
        },
        'stores': (context) {
          return const Stores_Screen();
        },
        'reserve': (context) {
          return const Reserve_Screen();
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}


