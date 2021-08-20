import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //o retorno é um futureBuilder porque estamos retornando dados do firebase
    return FutureBuilder<QuerySnapshot>(
      //aqui tá obtendo todas as categorias da colegação produtos
      future: FirebaseFirestore.instance.collection('products').get(),
        builder: (context, snapshot) {
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator(),);
          else {
            return ListView(
              children: [
                //aqui vamos exibir todas as categorias
              ],
            );
          }
        }
    );
  }
}
