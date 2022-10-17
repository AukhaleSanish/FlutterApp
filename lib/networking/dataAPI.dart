import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/productModel.dart';

Future<List<ProductData>> getData() async {
  final response = await http.get(
      Uri.parse('https://mocki.io/v1/04a6acf9-fbb0-4d77-96a8-bf7a5a0e386a'));
  var responseData = jsonDecode(response.body);
  List<ProductData> products = [];
  for (var tmpProducts in responseData) {
    ProductData prods = ProductData(
      id: tmpProducts["id"],
      title: tmpProducts["title"],
      price: tmpProducts["price"].toString(),
      image: tmpProducts["image"],
      description: tmpProducts["description"],
      category: tmpProducts["category"],
      rating: tmpProducts["rating"]['rate'].toString(),
      fPrice: 0.0,
      quantity: 0,
    );
    products.add(prods);
  }
  return products;
}
