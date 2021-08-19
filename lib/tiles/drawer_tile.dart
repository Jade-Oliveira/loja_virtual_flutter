import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  //colocando o pageController aqui consigo alterar a página por cada um dos drawersTile
  //no page vou colocar a qual página corresponde cada drawer
  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    //retorna um material para dar um efeito visual no ícone
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          //fecha o menu lateral
          Navigator.of(context).pop();
          //essa função vai dizer para qual página vai
          controller.jumpToPage(page);
        },
        child: Container(
          height: 65.0,
          child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                color: controller.page == page ?
                    Theme.of(context).primaryColor : Colors.grey[700]
              ),
              SizedBox(width: 32.0),
              Text(text, style: TextStyle(
                fontSize: 16.0,
                color: controller.page == page ?
                Theme.of(context).primaryColor : Colors.grey[700]
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
