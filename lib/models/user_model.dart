import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  //model é um objeto que vai guardar os estados de alguma coisa
  //nesse caso vai armazenar o usuário atual e ter todas as funções que vão modificar o estado atual

  //variável que vai indicar quando o UserModel tá processando algo

  FirebaseAuth _auth = FirebaseAuth.instance;

  late User firebaseUser;

  //vai abrigar os dados do usuário
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  //voidCallback, função que vamos passar e ela será chamada dentro da função
  void signUp(
      {required Map<String, dynamic> userData,
      required String pass,
      required VoidCallback onSuccess,
      required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    //aqui tentamos criar nosso usuário
    _auth
        .createUserWithEmailAndPassword(
            email: userData['email'],
            password:
                pass) //depois que processar isso, vai chamar a função de dentro do then
        .then((user) async {
      firebaseUser = user as User;

      //para salvar os dados no firestore
      await _saveUserData(userData);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signIn() async {
    isLoading = true;
    //para mostrar que modificou algo no modelo e que a view precisa ser atualizada usamos o notify
    //o notify vai recriar tudo que estiver dentro do scopedmodeldescendant
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void recoverPass() {}

  //usamos _ para funções internas
  //salvamos os dados na coleção users no documento correspondente ao id do usuário
  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .set(userData);
  }

  //se o firebaseUser for diferente de nulo ele vai retornar true indicando que tem um usuário logado
  bool isLoggedIn() {
    return firebaseUser != null;
  }
}
