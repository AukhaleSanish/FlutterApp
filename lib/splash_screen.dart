import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 1000),(){});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyLogin()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Sanish Aukhale', style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
              color: Colors.lightGreen,
          )),
        ),
      ),
    );
  }
}
