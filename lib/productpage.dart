import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class ProdPage extends StatefulWidget {
  const ProdPage({Key? key}) : super(key: key);

  @override
  State<ProdPage> createState() => _ProdPageState();
}
//class _prodPageState extends State<prodPage>
class _ProdPageState extends State<ProdPage>{
  late List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME1'),
        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/products.json'),
            builder: (context, snapshot) {

              var newData = json.decode(snapshot.data.toString());
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    childAspectRatio:0.2, ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 10, right: 10),
                      child: Column(
                        children: <Widget>[
                        Container(
                              padding: const EdgeInsets.all(2),
                              height: 70,
                              width: 70,
                              child: Image.asset(newData[index]['imageLink']),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(newData[index]['productName'],
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Row(
                              children: [
                                Container(
                                  child:  Text("Price: Rs. "+newData[index]['productPrice'],
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                    ),
                  );
                },
                itemCount: newData == null ? 0 : newData.length
              );
            },
          ),
        ));
  }
}
