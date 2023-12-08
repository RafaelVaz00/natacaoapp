import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../model/Atleta.dart';
import '../model/Usuario.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Classe responsável por realizar tarefas de cadastro, normalmente feitas por um admin, mas também podendo
// ser feita por um treinador.

class AdministradorController {

  FirebaseFirestore iniciarFireStore(){
    FirebaseFirestore db;
    return db = FirebaseFirestore.instance;
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

  void cadastrarUsuarioEmailSenha(String email, String senha) async{
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: senha);
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        print('insira uma senha maior!');
      }else if (e.code=='email-alredy-in-use'){
        print('uma conta com esse email já está cadastrado');
      }
    } catch (e){
      print (e);
    }
  }

  Future<void> criarDocumentoUsuarioPrimeiroAcesso(Usuario? usuario) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentSnapshot documentoOriginal = await firestore.collection('preCadastro').doc(usuario?.idDocumento).get();
    Map<String, dynamic>? dados = documentoOriginal.data() as Map<String, dynamic>?;

    String userID = auth.currentUser!.uid;

    try {
      if (userID != null) {

        // Referência ao documento na coleção "usuarios" com o UID como nome e seta os dados do pré cadastro
        DocumentReference userDocumentRef = firestore.collection('usuarios').doc(userID);
        userDocumentRef.set(dados!);

        userDocumentRef.update({'flagPA': false, 'idDocumento': userID});

        //deleta o documento de pré cadastro
        await firestore.collection('preCadastro').doc(usuario?.idDocumento).delete();

        print('Documento do usuário criado com sucesso.');
      } else {
        print('Usuário não autenticado.');
      }
    } catch (e) {
      print('Erro ao criar documento do usuário: $e');
    }
  }

  void cadastroUsuario(String nome, String email, String tipoConta, String senha)async {
    iniciarFireStore();
    final user = <String, dynamic>{
      "nome": nome,
      "email": email,
      "tipoConta": tipoConta,
      "statusConta": "ATIVA",
      "senha": senha,
      "flagPA": true,
      "verificado" : false
    };

    iniciarFireStore().collection("preCadastro")
        .add(user).then((DocumentReference doc) => print('a conta foi criada'));

  }


  void completarCadastro(String idDocumento, String nome, String nascimento,String naturalidade,
      String nacionalidade, String rg, String cpf, String sexo, String endereco, String bairro,
      String cidade, String uf, String cep, String maeAtleta, String paiAtleta, String clubeOrigem,
      String empresa, String convenio, String alergias, String provas, String telefoneCelular,
      String telefoneResidencial, String  telefoneTrabalho, String  telefoneEmergencia,
      String telefonePai, String telefoneMae
      )async{
    iniciarFireStore();
    final user = <String, dynamic>{
      "nome":nome,
      "dtn_atleta":nascimento,
      "nat_atleta": naturalidade,
      "nac_atleta": nacionalidade,
      "rg_atleta": rg,
      "cpf_atleta":cpf,
      "sex_atleta":sexo,
      "end_atleta":endereco,
      "bai_atleta":bairro,
      "cid_atleta":cidade,
      "uf_atleta":uf,
      "cep_atleta":cep,
      "mae_atleta":maeAtleta,
      "pai_atleta":paiAtleta,
      "clb_origem_atleta":clubeOrigem,
      "emp_trabalha_atleta":empresa,
      "cvm_atleta":convenio,
      "alg_atleta":alergias,
      "prv_atleta":provas,
      "telefoneCelular": telefoneCelular,
      "telefoneResidencial": telefoneResidencial,
      "telefoneTrabalho": telefoneTrabalho,
      "telefoneEmergencia": telefoneEmergencia,
      "telefonePai" : telefonePai,
      "telefoneMae": telefoneMae,
      "verificado" : true,
      "idDocumento": idDocumento
    };

    await iniciarFireStore()
        .collection("preCadastro")
        .doc(idDocumento)
        .update(user);
  }

  Future<String?> obterUserID() async{
    verificarAutenticacao();

    if(FirebaseAuth.instance.currentUser != null){
      return FirebaseAuth.instance.currentUser?.uid.toString();
    }
    return null;
  }

  Future<List<Usuario>> obterListaUsuarios() async{
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      QuerySnapshot querySnapshot = await firestore.collection('preCadastro').get();

      try{
      List<Usuario> usuarios = querySnapshot.docs.map((documento) {
      return Usuario(
        email_atleta: documento['email_atleta'],
        flagPA: documento['flagPA'],
        nome: documento['nome'],
        senha: documento['senha'],
        tipoConta: documento['tipoConta'],
          idDocumento: documento['idDocumento']
      );
      }).toList();
      return usuarios;
    } catch (e) {
    print('Erro ao buscar usuários: $e');
    return [];
    }
  }

  Future<List<Atleta>> obterListaAtletas() async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore.collection('usuarios').get();

    try{
      List<Atleta> atleta = querySnapshot.docs.map((documento) {
        return Atleta(
            email_atleta: documento['email_atleta'],
            nome: documento['nome'],
        );
      }).toList();
      return atleta;
    } catch (e) {
      print('Erro ao buscar usuários: $e');
      return [];
    }
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
