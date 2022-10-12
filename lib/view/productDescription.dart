import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final Map<String, String> productData;
  final snp;
  final index;
  ProductDescription(this.productData, this.snp, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFE7DA),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFFFE7DA),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  child: Image.network(
                    snp.data[index].image,
                    width: 120,
                    height: 120,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  child: AutoSizeText(
                    snp.data[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxFontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  child: AutoSizeText(
                    "\$ " + snp.data[index].price,
                    textAlign: TextAlign.center,
                    maxFontSize: 16,
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
