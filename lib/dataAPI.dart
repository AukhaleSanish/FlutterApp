import 'dart:convert';
import 'package:http/http.dart' as http;

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

class ProductData {
  int id;
  String title;
  String image;
  String price;

  ProductData({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });
}
