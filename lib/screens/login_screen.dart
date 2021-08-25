import 'package:flutter/material.dart';
import 'package:loja_virtual_flutter/models/user_model.dart';
import 'package:loja_virtual_flutter/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {

  //chave crida para conseguirmos acessar o formulário dentro do botão 'entrar'
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              //pushReplacemente porque eu quero clicar aqui e substituir minha tela e depois que criar a conta o usuário já estará logado
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignupScreen())
              );
            },
            child: Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          )
        ],
      ),
      //criamos uma forma de acessar o nosso modelo
        //quando modificar algo no UserModel, toda essa parte será reconstruída
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator());
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if(text!.isEmpty || !text.contains('@')) return 'Email inválido!';
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Senha'),
                  //não mostra a senha digitada
                  obscureText: true,
                  validator: (text) {
                    if(text!.isEmpty || text.length < 6) return 'Senha inválida';
                  },
                ),
                //usamos o align para alinhar o botão
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      'Esqueci minha senha',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                //usamos sizedbox aqui para deixar o botão mais alto
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      //aqui pedimos para validar nossos campos
                      if(_formKey.currentState!.validate()){

                      }
                      model.signIn();
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
