import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanish/view/productDisplayPage.dart';

Future<void> readJson(uName,password,context) async {
  List users = [];

  final String response = await rootBundle.loadString('assets/cred.json');
  final data = await json.decode(response);
  users = data["users"];
  if (uName == users[0]["uname"] && password== users[0]["pass"]) {
    Future.delayed(Duration(milliseconds: 1000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ProdPage()));
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         content: Text("Successful"),
    //       );
    //     },
    //   );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Unsuccessful"),
        );
      },
    );
  }
}