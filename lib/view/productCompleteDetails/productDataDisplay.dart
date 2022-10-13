import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboveHalf extends StatelessWidget {
  final snp;
  final index;
  const AboveHalf({
    Key? key,
    required this.snp,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "\nPrice\n",
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: "\$ " + snp.data[index].price + "\n\n",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.red,
                      //  fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: "Ratings\n",
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: snp.data[index].rating,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                    ),
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              TextSpan(
                text: "\n\nCategory\n",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: snp.data[index].category + "\n",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.red,
                      //fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Image.network(
            snp.data[index].image,
            fit: BoxFit.fitHeight,
            height: 150,
          ),
        )
      ],
    );
  }
}
