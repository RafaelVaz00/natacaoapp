import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Classe responsável por trazer todas as informações Necessárias do firebase do
// usuário atua. Também pode ser vista como um controller dos dados da sessão.

class UsuarioController {

  void iniciarFireStore(){
  var db = FirebaseFirestore.instance;
  }

  void iniciarFireBase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void verificarAutenticacao() async{
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if(user == null){
        print("O usuario está desconectado!");
      }
      print("O usuario está conectado!");
    });
  }

  void desconectarUsuarioAtual() async{
    await FirebaseAuth.instance.signOut();
  }


  Future<String?> obterUserID() async{

    verificarAutenticacao();

    if(FirebaseAuth.instance.currentUser != null){
      // return FirebaseAuth.instance.currentUser?.uid.toString(); antigo
      return FirebaseAuth.instance.currentUser!.uid.toString();
    }
    return null;
  }

  Future<String?> obterNomeUsuario() async{

    final String? collectionId = await obterUserID();

      try{
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(collectionId)
            .get();

        if(documentSnapshot.exists){
          String? nomeUsuario = documentSnapshot.get('nome');

          return nomeUsuario;
        } else {
          print('Documento não encontrado');
          return null;
        }
      } catch (e){
        print('Erro ao ler o campo: $e');
        return null;
      }
  }

  Future<String?> obterTipoConta() async{

    final String? collectionId = await obterUserID();

    try{
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(collectionId)
          .get();

      if(documentSnapshot.exists){
        String? tipoConta = documentSnapshot.get('tipoConta');

        return tipoConta;
      } else {
        print('Documento não encontrado');
        return null;
      }
    } catch (e){
      print('Erro ao ler o campo: $e');
      return null;
    }

  }



}
