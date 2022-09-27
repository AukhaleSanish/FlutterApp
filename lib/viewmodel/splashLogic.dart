// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanish/view/productDisplayPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/loginDisplay.dart';
import '../view/splashDisplay.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    var recievedName;
    List users = [];
    //shared preferences  <--Getting values for checking
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    recievedName = prefs.getString("unameSending");
    //reding json
    final String response = await rootBundle.loadString('assets/cred.json');
    final data = await json.decode(response);
    users = data["users"];
    if (users[0]["uname"] == recievedName) {
      await Future.delayed(const Duration(milliseconds: 2000), () {});
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ProdPage()));
    } else {
      await Future.delayed(const Duration(milliseconds: 1000), () {});

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyLogin()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashDisplay();
  }
}

