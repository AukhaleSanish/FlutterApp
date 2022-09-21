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
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                //decoration: TextDecoration.underline,
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
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                      hintText: 'USERNAME'
                  ),
                ),
                SizedBox(
                  height: 10,
                ), //For Spacing
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'PASSWORD'),
                ),
                SizedBox(
                  height: 40,
                ), //For Spac
                ElevatedButton(
                  onPressed: () async {
                    readJson(uName.text,password.text,context);
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('unameSending', uName.text);
                  },
                  child: Text('SIGN IN'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
    );
  }
}
