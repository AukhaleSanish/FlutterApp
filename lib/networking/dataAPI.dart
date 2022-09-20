import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/productModel.dart';

Future<List<ProductData>> getData() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));
  var responseData = jsonDecode(response.body);
  List<ProductData> products = [];
  for (var tmpProducts in responseData) {
    ProductData prods = ProductData(
      id: tmpProducts["id"],
      title: tmpProducts["title"],
      price: tmpProducts["price"].toString(),
      image: tmpProducts["image"],
    );
    products.add(prods);
  }
  return products;
}


