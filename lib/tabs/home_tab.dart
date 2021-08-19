import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );

    return Stack(
      children: [
        _buildBodyBack(),
        //barra que fica por cima do conteúdo até certo ponto do scroll
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Novidades'),
                centerTitle: true,
              ),
            ),
            //futureBuilder porque não vai obter os dados do firebase imediatemente
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('home')
                  .orderBy('pos')
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  //não conseguimos colocar um componente normal dentro de um sliver, por isso usamos o adapter
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                else {
                  // final data = snapshot.data as QuerySnapshot<Map>;

                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    //lista de dimensões para cada uma das imagens
                    //pegamos a lista de documentos e mapeamos essa lista
                    staggeredTiles: snapshot.data!.docs.map((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      final x = data['x'];
                      final y = 0.0 + data['y'];
                      return StaggeredTile.count(x, y);
                    }).toList(),
                    children: snapshot.data!.docs.map((doc) {
                      return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: doc['image'],
                          fit: BoxFit.cover);
                    }).toList(),
                  );
                }
              },
            )
          ],
        ),
      ],
    );
  }
}
