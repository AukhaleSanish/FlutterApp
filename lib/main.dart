import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanish/provider/cart_provider.dart';
import '../view-model/splashViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Project1',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Screen1(),
          );
        },
      ),
    );
  }
}
