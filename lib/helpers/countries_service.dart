import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/countries_model.dart';

class CountriesService extends ChangeNotifier {
  final String _baseUrl = "rigel-isw9a-default-rtdb.firebaseio.com"; 
  final List<Countries> countries = [];

  bool isLoading = false;

  CountriesService() {
    loadCountries();
  } 

  Future<List<Countries>> loadCountries() async {
    isLoading = false;
    notifyListeners();

    final url  = Uri.https(_baseUrl, 'countries.json');
    final resp = await http.get(url);

    final Map<String, dynamic> countriesMap = json.decode(resp.body);

    countriesMap.forEach((key, value) {
      final countries = Countries.fromMap(value);
      countries.id = key;
      this.countries.add(countries);

    });

    return countries;

  }

}