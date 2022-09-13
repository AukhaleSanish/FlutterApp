import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final uName = TextEditingController();
  final password = TextEditingController();
  List _users = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/cred.json');
    final data = await json.decode(response);
    setState(() {
      _users = data["users"];
      setState(() {
              if(uName.text==_users[0]["uname"] && password.text==_users[0]["pass"]){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Successful"),
                      );
                    },
                  );
              }
              else{
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Unsuccessful"),
                    );
                  },
                );
              }

      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30,top: 125),
            child: Text('LOGIN', style: TextStyle(
              color: Colors.green,
              fontSize: 24,
            ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25,right: 30,left: 30),
            child: Column(
              children: [
                TextField(
                  controller: uName,
                  decoration: InputDecoration(
                    hintText: 'USERNAME'
                  ),
                ),
                SizedBox(
                  height: 10,
                ),//For Spacing
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'PASSWORD'
                  ),
                ),
                SizedBox(
                  height: 50,
                ),//For Spac
                ElevatedButton(
                  // onPressed: () {setState(() {
                  //   // alert
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         content: Text("Username: "+ myController.text),
                  //       );
                  //     },
                  //   );
                  // });
                  // },//submit code

                  child: Text('Login'),
                  onPressed: readJson,
                ),

                // _users.isNotEmpty ?
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: _users.length,
                //     itemBuilder: (context, index) {
                //       return Card(
                //         margin: const EdgeInsets.all(10),
                //         child: ListTile(
                //           leading: Text(_users[index]["uname"]),
                //           title: Text(_users[index]["pass"]),
                //           subtitle: Text(_users[index]["isActive"]),
                //         ),
                //       );
                //     },
                //   ),
                // )
                //     : Container()
              // if()
              // {
              //
              // }
              // Column(

              ],
            ),
          ),
        ],
      ),
    );
  }
}
