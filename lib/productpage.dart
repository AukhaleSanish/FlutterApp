import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class prodPage extends StatefulWidget {
  const prodPage({Key? key}) : super(key: key);

  @override
  State<prodPage> createState() => _prodPageState();
}
//class _prodPageState extends State<prodPage>
class _prodPageState extends State<prodPage>{
  late List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
        ),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/products.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var newData = json.decode(snapshot.data.toString());
              return GridView.builder(

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(

                      padding: const EdgeInsets.only(
                          top: 20, bottom: 100, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              InkWell(
                                child: Text(
                                  newData[index]['productName'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                              Text("Price: Rs. "+newData[index]['productPrice'],
                                //'Note Text',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                          //SizedBox(width: 20),
                          Container(

                            // padding: const EdgeInsets.all(4),
                            height: 70,
                            width: 70,
                            child: Image.asset(newData[index]['imageLink']),
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
