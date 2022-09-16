import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanish/productpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

var recievedName;

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
    List users = [];
    //shared preferences  <--Getting values for checking
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    recievedName = prefs.getString("unameSending");

    //reding json
    final String response = await rootBundle.loadString('assets/cred.json');
    final data = await json.decode(response);
      users = data["users"];
      if(users[0]["uname"]==recievedName) {
        await Future.delayed(Duration(milliseconds: 1000),(){});
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ProdPage()));
    }
      else{
        await Future.delayed(Duration(milliseconds: 1000),(){});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyLogin()));
      }

    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => MyLogin()));   <---Need to add
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
