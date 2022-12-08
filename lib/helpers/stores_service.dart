import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/stores_model.dart';

class StoresService extends ChangeNotifier {
  final String _baseUrl = "rigel-isw9a-default-rtdb.firebaseio.com"; 
  final List<Stores> stores = [];

  bool isLoading = false;

  StoresService() {
    loadStores();
  } 

  Future<List<Stores>> loadStores() async {
    isLoading = false;
    notifyListeners();

    final url  = Uri.https(_baseUrl, 'stores.json');
    final resp = await http.get(url);

    final Map<String, dynamic> storesMap = json.decode(resp.body);

    storesMap.forEach((key, value) {
      final stores = Stores.fromMap(value);
      stores.id = key;
      this.stores.add(stores);

    });


    return stores;

  }

}