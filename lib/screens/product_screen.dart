import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/datas/product_data.dart';

class ProductScreen extends StatefulWidget {


  //recebemos o produto
  final ProductData product;

  ProductScreen(this.product);

  //passamos o produto para o nosso estado

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {

  //salva o produto aqui
  final ProductData product;

  //o estado recebe o produto
  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    //da forma que fizemos acima é possível acessar diretamente as propriedades do product
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
    );
  }
}
