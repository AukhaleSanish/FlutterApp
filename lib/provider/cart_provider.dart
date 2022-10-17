import 'package:flutter/cupertino.dart';
import 'package:sanish/provider/db_helper.dart';
import 'package:sanish/model/productModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  DBHelper db = DBHelper();

  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  late Future<List<ProductData>> _cart;
  Future<List<ProductData>> get cart => _cart;
  Future<List<ProductData>> getCartData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void _setPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setPrefData();
    notifyListeners();
  }

  void subCounter() {
    _counter--;
    _setPrefData();
    notifyListeners();
  }

  int getCounter() {
    _getPrefData();
    return _counter;
  }

  void addPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefData();
    notifyListeners();
  }

  void subPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefData();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefData();
    return _totalPrice;
  }
}
