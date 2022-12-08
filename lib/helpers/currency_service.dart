import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/currency_model.dart';


class CurrencyService extends ChangeNotifier {
  final String _baseUrl = "rigel-isw9a-default-rtdb.firebaseio.com"; 
  final List<Currencies> currency = [];

  bool isLoading = false;

  CurrencyService() {
    loadCurrency();
  } 

  Future<List<Currencies>> loadCurrency() async {
    isLoading = false;
    notifyListeners();

    final url  = Uri.https(_baseUrl, 'currencies.json');
    final resp = await http.get(url);

    final Map<String, dynamic> currencyMap = json.decode(resp.body);

    currencyMap.forEach((key, value) {
      final currency = Currencies.fromMap(value);
      currency.id = key;
      this.currency.add(currency);

    });

    return currency;

  }

}