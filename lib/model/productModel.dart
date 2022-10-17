class ProductData {
  int id;
  String title;
  String image;
  String price;
  String description;
  String category;
  String rating;
  double fPrice;
  int quantity;
  ProductData({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
    required this.fPrice,
    required this.quantity,
  });
  ProductData.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        title = res['title'],
        image = res['image'],
        price = res['price'],
        description = res['description'],
        category = res['category'],
        rating = res['rating'],
        fPrice = res['fPrice'],
        quantity = res['quantity'];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'description': description,
      'category': category,
      'rating': rating,
      'fPrice': fPrice,
      'quantity': quantity,
    };
  }
}
