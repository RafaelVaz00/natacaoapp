import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {

  void iniciarFireBase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }


  Future<void> enviarEmailRedefinicaoSenha(String email) async {

    iniciarFireBase();

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e){
      print(e);
    }
  }

  Future<void> realizarLogin(String email, String password) async {

    try{
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
        password: password
      );

    } on FirebaseAuthException catch (e){
      if(e.code == 'user-not-found'){
        print('Esse email não foi encontrado.');
      }else if(e.code == 'wrong-password'){
        print('Senha incorreta, tente novamente!');
      }
    }
  }


}
