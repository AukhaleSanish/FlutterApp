import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashDisplay extends StatelessWidget {
  const splashDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Sanish Aukhale',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
              )),
        ),
      ),
    );
  }
}
