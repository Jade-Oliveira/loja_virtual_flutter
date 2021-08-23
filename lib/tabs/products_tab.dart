import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/tiles/category_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //o retorno é um futureBuilder porque estamos retornando dados do firebase
    return FutureBuilder<QuerySnapshot>(
        //aqui tá obtendo todas as categorias da colegação produtos
        future: FirebaseFirestore.instance.collection('products').get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            //colocamos um comando para dividir as tiles
            var dividedTiles = ListTile.divideTiles(
                    tiles: snapshot.data!.docs.map((doc) {
                      return CategoryTile(doc);
                    }).toList(),
                    color: Colors.grey[500])
                .toList();
            return ListView(
              //aqui vamos gerar a lista de categoryTile
              //pega cada doc, troca cada doc para categoryTile e transforma tudo isso em uma lista
              children: dividedTiles,
            );
          }
        });
  }
}
