import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanish/view/productView.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

Future<dynamic> readJson(uName, password, context) async {
  List users = [];

  final String response = await rootBundle.loadString('assets/cred.json');
  final data = await json.decode(response);
  users = data["users"];
  if (uName == users[0]["uname"] && password == users[0]["pass"]) {
    Future.delayed(const Duration(milliseconds: 1000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const ProdPage()));
  } else {
    return showTopSnackBar(
      context,
      const CustomSnackBar.error(message: "Enter the correct details"),
    );
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const AlertDialog(
    //       content: Text("Unsuccessful"),
    //     );
    //   },
    // );
  }
}
