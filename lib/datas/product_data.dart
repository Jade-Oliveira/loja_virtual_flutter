//classe para armazenar os dados do produto
//quando estamos mexendo com grane volume de dados é importante dividir em classes para armazenar os dados e não acessar somente por snapshot por exemplo

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  late String category;

  late String id;
  late String title;
  late String description;
  late double price;
  late List images;
  late List sizes;

  //pegamos o documento no firebase e transformamos nesses dados citados acima para criar o Product Data
  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.id;
    title = snapshot['title'];
    description = snapshot['description'];
    price = 0.0 + snapshot['price'];
    images = snapshot['images'];
    sizes = snapshot['sizes'];
  } //convertendo os dados do documento para os dados da nossa classe

  //função que resume as informações que queremos mostrar nos pedidos
  Map<String, dynamic> toResumedMap() {
    return {'title': title, 'description': description, 'price': price};
  }
}
