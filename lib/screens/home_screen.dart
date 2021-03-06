import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/tabs/home_tab.dart';
import 'package:loja_virtual_flutter/tabs/orders_tab.dart';
import 'package:loja_virtual_flutter/tabs/places_tab.dart';
import 'package:loja_virtual_flutter/tabs/products_tab.dart';
import 'package:loja_virtual_flutter/widgets/cart_button.dart';
import 'package:loja_virtual_flutter/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //pageView permite arrastar de uma página para outra, mas podemos evitar que o usuário possa arrastar
    return PageView(
      controller: _pageController,
      //evita que a página seja arrastada para o lado
      physics: NeverScrollableScrollPhysics(),
      children: [
        //componentizando os elementos da página
        Scaffold(
          body: HomeTab(),
          //menu lateral para navegação
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Produtos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Lojas'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PlacesTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Meus Pedidos'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: OrdersTab(),
        ),
      ],
    );
  }
}
