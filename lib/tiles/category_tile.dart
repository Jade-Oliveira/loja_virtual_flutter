import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {

  //vai pegar os dados do documento, ou seja, nome e ícone da categoria
  final DocumentSnapshot snapshot;


  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //ícone que fica na esquerda
      leading: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot['icon']),
      ),
      title: Text(snapshot['title']),
      //seta do lado direito
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CategoryScreen(snapshot))
        );
      },
    );
  }
}
