import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //tudo que estiver abaixo do scopedmodel vai ter acesso ao UserModel e vai ser modificado caso aconteça algo no usermodel
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: "Jade's Clothing",
          theme: ThemeData(
            primarySwatch: Colors.blue,
            //a = opacidade
            primaryColor: Color.fromARGB(255, 4, 125, 141),
          ),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        )
    );
  }
}

