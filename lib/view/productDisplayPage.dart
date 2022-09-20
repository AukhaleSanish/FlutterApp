import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../networking/dataAPI.dart';

class ProdPage extends StatefulWidget {
  const ProdPage({Key? key}) : super(key: key);

  @override
  State<ProdPage> createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PRODUCT PAGE'),
        ),

        body: Center(
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width * 0.002,
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          child: Image.network(snapshot.data[index].image,
                              width: 120, height: 120),
                        ),
                        Container(
                            margin: EdgeInsets.all(12),
                            child: AutoSizeText(
                              snapshot.data[index].title,
                              overflow: TextOverflow.ellipsis,maxFontSize: 20,
                            )),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          child: AutoSizeText(
                            "\$ " + snapshot.data[index].price,
                            textAlign: TextAlign.center,maxFontSize: 16,
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
