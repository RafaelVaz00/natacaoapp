import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Classe responsável por trazer todas as informações Necessárias do firebase do
// usuário atua. Também pode ser vista como um controller dos dados da sessão.

class UsuarioController {

  FirebaseFirestore iniciarFireStore(){
    return FirebaseFirestore.instance;
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

  Future<void> enviarRecuperacaoSenha(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print('Erro ao enviar o email de recuperação de senha: $e');
    }
  }

  Future<void> trocarEmail(String novoEmail) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateEmail(novoEmail);

        print('E-mail atualizado para $novoEmail');
      } else {
        print('Usuário não autenticado');
      }
    } catch (e) {
      print('Erro ao atualizar o e-mail: $e');
    }
  }

  Future<String?> obterUserID() async{

    if(FirebaseAuth.instance.currentUser != null){
      // return FirebaseAuth.instance.currentUser?.uid.toString(); antigo
      return FirebaseAuth.instance.currentUser!.uid.toString();
    }
    return null;
  }

  Future<String?> obterNomeUsuario() async{

    // final String? collectionId = await obterUserID();

      try{
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(FirebaseAuth.instance.currentUser!.uid.toString())
            .get();

        if(documentSnapshot.exists){
          String? nomeUsuario = documentSnapshot.get('nome');

          return nomeUsuario;
        } else {
          print('Documento não encontrado no usuario controller');
          return null;
        }
      } catch (e){
        print('Erro ao ler o campo: $e');
        return null;
      }
  }

  Future<String?> obterTipoConta() async{

    // final String? collectionId = await obterUserID();

    try{
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .get();

      if(documentSnapshot.exists){
        String? tipoConta = documentSnapshot.get('tipoConta');

        return tipoConta;
      } else {
        print('tipo conta não encontrado');
        return null;
      }
    } catch (e){
      print('Erro ao ler o campo: $e');
      return null;
    }

  }



}
