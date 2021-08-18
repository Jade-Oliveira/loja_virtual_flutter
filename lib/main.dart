import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jade's Clothing",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //a = opacidade
        primaryColor: Color.fromARGB(255, 4, 125, 141),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

