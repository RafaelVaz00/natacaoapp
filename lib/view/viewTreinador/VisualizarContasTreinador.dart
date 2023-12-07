import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'CriarContaTreinador.dart';

class VisualizarContasTreinador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contas Pré Cadastradas'),
      ),
      body: SingleChildScrollView(
        child: _buildPreCadastroList(context),
      ),
    );
  }

  Widget _buildPreCadastroList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Pré Cadastro',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('preCadastro').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else {
              return Column(
                children: snapshot.data!.docs
                    .where((document) => document['verificado'] == false)
                    .map((document) {
                  final email = document['email'];
                  final tipoConta = document['tipoConta'];
                  return Card(
                    child: ListTile(
                      title: Text('Email: $email'),
                      subtitle: Text('Tipo de Conta: $tipoConta'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          _finalizarCadastro(context, document.id);
                        },
                        child: Text('Finalizar Cadastro'),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ],
    );
  }

  void _finalizarCadastro(BuildContext context, String documentId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CriarContaTreinador(documentId: documentId)),
    );
  }
}
