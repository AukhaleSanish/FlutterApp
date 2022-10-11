import 'package:flutter/material.dart';

class SplashDisplay extends StatelessWidget {
  const SplashDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Sanish Aukhale',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
      backgroundColor: Color(0xFFFFE7DA),
    );
  }
}
