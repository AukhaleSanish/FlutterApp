import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanish/view/singleProductDisplay.dart';
import 'cartView.dart';
import '../provider/cart_provider.dart';
import '../provider/db_helper.dart';

import '../networking/dataAPI.dart';

class ProdPage extends StatefulWidget {
  const ProdPage({Key? key}) : super(key: key);
  @override
  State<ProdPage> createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage> {
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRODUCT PAGE'),
        centerTitle: true,
        backgroundColor: Colors.red.shade200,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Center(
              child: Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.getCounter().toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
                animationDuration: Duration(milliseconds: 300),
                child: Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFE7DA),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  color: Colors.white,
                ),
              );
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width * 0.002,
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Map<String, String> productData = {};
                      productData['product_img'] = snapshot.data[index].image;
                      productData['product_name'] = snapshot.data[index].title;
                      productData['product_price'] = snapshot.data[index].price;
                      productData['category'] = snapshot.data[index].category;
                      productData['desc'] = snapshot.data[index].description;
                      productData['rating'] = snapshot.data[index].rating;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext ctx) =>
                              ProductDescription(productData, snapshot, index),
                        ),
                      );
                    },
                    child: Card(
                      //color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(14),
                            child: Image.network(
                              snapshot.data[index].image,
                              width: 120,
                              height: 120,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(12),
                            child: AutoSizeText(
                              snapshot.data[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxFontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Container(
                            child: AutoSizeText(
                              "\$ " + snapshot.data[index].price,
                              textAlign: TextAlign.center,
                              maxFontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
