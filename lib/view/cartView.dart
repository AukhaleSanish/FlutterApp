import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../model/productModel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CART'),
        centerTitle: true,
        backgroundColor: Colors.red.shade200,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFFFE7DA),
      body: Column(
        children: [
          FutureBuilder(
            future: cart.getCartData(),
            builder: (context, AsyncSnapshot<List<ProductData>> snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      snapshot.data![index].image,
                                      width: 120,
                                      height: 120,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          snapshot.data![index].title,
                                          overflow: TextOverflow.ellipsis,
                                          maxFontSize: 20,
                                        ),
                                        AutoSizeText(
                                          "\$ " + snapshot.data![index].price,
                                          textAlign: TextAlign.center,
                                          maxFontSize: 16,
                                        ),
                                      ],
                                    ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
              return Text('ERROR1');
            },
          )
        ],
      ),
    );
  }
}
