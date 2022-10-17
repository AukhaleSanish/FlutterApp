import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../model/productModel.dart';

class DBHelper {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDir = await getApplicationDocumentsDirectory();
    String path = join(documentDir.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id VARCHAR PRIMARY KEY ,title TEXT,image TEXT, price TEXT, description TEXT,category TEXT, rating TEXT, fPrice DOUBLE, quantity INTEGER)');
  }

  Future<ProductData> insert(ProductData cart) async {
    var dbclient = await db;
    await dbclient?.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<ProductData>> getCartList() async {
    var dbclient = await db;

    final List<Map<String, Object?>> queryResult =
        await dbclient!.query('cart');
    // print("q res" + queryResult.toString());
    return queryResult.map((e) => ProductData.fromMap(e)).toList();
  }
}
