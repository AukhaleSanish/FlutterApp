import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '/view/productCompleteDetails/productDataDisplay.dart';

class ProductDescription extends StatelessWidget {
  final Map<String, String> productData;
  dynamic snp;
  dynamic index;
  ProductDescription(this.productData, this.snp, this.index);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // title: const Text('PRODUCT PAGE'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),

        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.search),
          //   color: Colors.black,
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black,
          )
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
                          snp.data[index].description,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        AutoSizeText(
                          snp.data[index].title,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                          maxFontSize: 18,
                        ),
                        AboveHalf(snp: snp, index: index),
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
