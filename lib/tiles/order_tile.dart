import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderId;

  const OrderTile(this.orderId);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          //streambuilder para observar a alteração do estado do produto no banco de dados em tempo real
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('orders')
                .doc(orderId)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Código do Pedido: ${snapshot.data!.id}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(_buildProductsText(snapshot.data!))
                  ],
                );
              }
            },
          ),
        ));
  }

  String _buildProductsText(DocumentSnapshot snapshot) {
    String text = 'Descrição:\n';

    //vamos pegar cada um dos produtos, é uma lista diferente, a linkedHashMap
    for (LinkedHashMap p in snapshot['products']) {
      text +=
          '${p['quantity']} x ${p['product']['title']} (R\$ ${p['product']['price'].toStringAsFixed(2)})\n';
    }
    text += 'Total: R\$ ${snapshot['totalPrice'].toStringAsFixed(2)}';

    return text;
  }
}
