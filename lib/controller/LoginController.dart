import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:natacaoapp/model/Usuario.dart';
import '../view/shared/layouts/Home.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';




class LoginController {

  Future<void> enviarEmailRedefinicaoSenha(String email) async {

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e){
      print(e);
    }
  }

  Future<void> realizarLogin(String email, String password, BuildContext context) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
        password: password
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
            (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        print('Esse email não foi encontrado ao tentar realizar login');
      }else if(e.code == 'wrong-password'){
        print('Senha incorreta, tente novamente!');
      }
    }
  }

  Future<Usuario?> verificarFlagPA(String email, String senha) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('preCadastro')
          .where('email', isEqualTo: email)
          .where('senha', isEqualTo: senha)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var documento = querySnapshot.docs.first;
        // Retorna o valor da flagPA se o usuário for encontrado.
        return Usuario(
          email_atleta: documento['email'],
          flagPA: documento['flagPA'],
          nome: documento['nome'],
          senha: documento['senha'],
          tipoConta: documento['tipoConta'],
          idDocumento: documento.id,
        );
      } else {
        // Retorna null se o usuário não for encontrado.

        return null;
      }
    } catch (e) {
      print('Erro ao buscar usuário: $e');
      // Retorna null em caso de erro.
      return null;
    }
  }




}
