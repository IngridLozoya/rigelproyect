import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../models/reserve_model.dart';


class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _iniDatabase();

  Future<Database> _iniDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'shops.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY,
        image TEXT,
        category TEXT,
        price DOUBLE,
        ranking TEXT,
        title TEXT,
        description TEXT,
        calories TEXT,
        aditives TEXT,
        vitamins TEXT
      )
      ''',
      );
    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY, 
        CANT INTEGER,
        title TEXT,
        price DOUBLE,
        image TEXT
      )
    ''');
  }

  Future<List<Product>> getProduct() async {
    Database db = await instance.database;
    var products = await db.query('Products', orderBy: 'title');

    List<Product> productList =
        products.isNotEmpty ? products.map((e) => Product.fromMap(e)).toList() : [];
    return productList;
  }

    Future<int> deleteProduct(int id) async {
    Database db = await instance.database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> addProduct(Product prod) async {
    Database db = await instance.database;
    return await db.insert('Products', prod.toMap());
  }

  Future<int> updateProduct(Product prod) async {
    Database db = await instance.database;
    return await db.update('products', prod.toMap(), where: 'id =?', whereArgs: [prod.title]);
  }

  //funciones para el carrito 

  Future<int> addtoCart(Cart cart) async {
    Database db = await instance.database;
    return await db.update('cart', cart.toMap());
  }

  Future<int> changeCant(Cart cart) async {
    Database db = await instance.database;
    return await db.update('cart', cart.toMap(), where: 'id =?', whereArgs: [cart.cant]);
  }

  Future<List<Cart>> getCart() async {
    Database db = await instance.database;
    var carrito = await db.query('cart', orderBy: 'id');

    List<Cart> cartList =
        carrito.isNotEmpty ? carrito.map((e) => Cart.fromMap(e)).toList() : [];
    return cartList;
  }

    Future<int> deletefromCart(int id) async {
    Database db = await instance.database;
    return await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

    Future<int> addtoReserve(Reserve res) async {
    Database db = await instance.database;
    return await db.update('Reserve', res.toMap());
  }

    Future<int> deletefromReserve(int id) async {
    Database db = await instance.database;
    return await db.delete('Reserve', where: 'id = ?', whereArgs: [id]);
  }

    Future<List<Reserve>> getReserve() async {
    Database db = await instance.database;
    var list = await db.query('reserve', orderBy: 'id');

    List<Reserve> resList =
        list.isNotEmpty ? list.map((e) => Reserve.fromMap(e)).toList() : [];
    return resList;
  }
}