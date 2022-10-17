import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '/model/productModel.dart';
import 'cartView.dart';
import '../provider/db_helper.dart';

class ProductDescription extends StatefulWidget {
  final Map<String, String> productData;
  dynamic snp;
  dynamic index;
  ProductDescription(this.productData, this.snp, this.index);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // title: const Text('PRODUCT PAGE'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.36),
                    padding: EdgeInsets.only(
                      top: size.height * 0.04,
                      left: 10,
                      right: 10,
                    ),
                    //height: 400,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFE7DA),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Description",
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          widget.snp.data[widget.index].description,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, left: 200),
                          child: ElevatedButton.icon(
                              onPressed: () {
                                dbHelper!
                                    .insert(ProductData(
                                        id: widget.snp.data[widget.index].id,
                                        title:
                                            widget.snp.data[widget.index].title,
                                        image:
                                            widget.snp.data[widget.index].image,
                                        price:
                                            widget.snp.data[widget.index].price,
                                        description: widget
                                            .snp.data[widget.index].description,
                                        category: widget
                                            .snp.data[widget.index].category,
                                        rating: widget
                                            .snp.data[widget.index].rating,
                                        fPrice: double.parse(widget
                                            .snp.data[widget.index].price),
                                        quantity: 1))
                                    .then((value) {
                                  print('Added');
                                  //print(value);
                                  //print(double.parse(snp.data[index].price));
                                  cart.addPrice(double.parse(
                                      widget.snp.data[widget.index].price));
                                  cart.addCounter();
                                }).onError((error, stackTrace) {
                                  print(error.toString());
                                });
                              },
                              icon: Icon(Icons.add_shopping_cart),
                              label: Text('ADD TO CART')),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        AutoSizeText(
                          widget.snp.data[widget.index].title,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                          maxFontSize: 18,
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "\nPrice\n",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text:
                                        "${"\$" + widget.snp.data[widget.index].price}\n\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                          color: Colors.red,
                                        ),
                                  ),
                                  const TextSpan(
                                    text: "Ratings\n",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: widget.snp.data[widget.index].rating,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                          color: Colors.red,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.0,
                                      ),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: "\n\nCategory\n",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        widget.snp.data[widget.index].category +
                                            "\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                          color: Colors.red,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Image.network(
                                widget.snp.data[widget.index].image,
                                fit: BoxFit.fitHeight,
                                height: 150,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
