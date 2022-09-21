import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              style:

              TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
