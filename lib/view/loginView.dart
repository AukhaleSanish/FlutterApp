import 'package:flutter/material.dart';
import '../viewmodel/loginViewModel.dart';
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
            padding: const EdgeInsets.only(left: 30, top: 125),
            child: const Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.black,
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
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'USERNAME'),
                ),
                const SizedBox(
                  height: 10,
                ), //For Spacing
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'PASSWORD'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () async {
                    readJson(uName.text, password.text, context);
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('unameSending', uName.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                  child: const Text('SIGN IN'),
                )
              ],
            ),
          ),
        ],
      ),
      // backgroundColor: Colors.blue,
    );
  }
}
