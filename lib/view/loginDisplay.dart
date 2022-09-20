import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../viewmodel/loginLogic.dart';
import 'productDisplayPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final uName = TextEditingController();
  final password = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, top: 125),
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.green,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.25,
                right: 30,
                left: 30),
            child: Column(
              children: [
                TextField(
                  controller: uName,
                  decoration: InputDecoration(hintText: 'USERNAME'),
                ),
                SizedBox(
                  height: 10,
                ), //For Spacing
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'PASSWORD'),
                ),
                SizedBox(
                  height: 50,
                ), //For Spac
                ElevatedButton(
                  onPressed: () async {
                    readJson(uName.text,password.text,context);
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('unameSending', uName.text);
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
