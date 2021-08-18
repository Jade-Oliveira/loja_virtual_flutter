import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/tabs/home_tab.dart';

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
        HomeTab()
      ],
    );
  }
}
