import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VisualizarContasAdm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualizar Contas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildUsuariosList(context),
            _buildPreCadastroList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUsuariosList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Usuários',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('usuarios').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else {
              return Column(
                children: snapshot.data!.docs.map((document) {
                  final email = document['email'];
                  final tipoConta = document['tipoConta'];
                  final statusConta = document['statusConta'];

                  return Card(
                    child: ListTile(
                      title: Text('Email: $email'),
                      subtitle: Text('Tipo de Conta: $tipoConta'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          if (statusConta == 'INATIVA') {
                            _exibirDialog(
                              context,
                              document.id,
                              'ATIVA',
                              'Ativar a Conta',
                            );
                          } else {
                            _exibirDialog(
                              context,
                              document.id,
                              'INATIVA',
                              'Inativar a Conta',
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: statusConta == 'INATIVA'
                              ? Colors.green // Botão verde se estiver inativo
                              : null,
                        ),
                        child: Text(
                          statusConta == 'INATIVA' ? 'ATIVAR' : 'INATIVAR',
                        ),
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
          future:
          FirebaseFirestore.instance.collection('preCadastro').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else {
              return Column(
                children: snapshot.data!.docs.map((document) {
                  final email = document['email'];
                  final tipoConta = document['tipoConta'];
                  final statusConta = document['statusConta'];

                  return Card(
                    child: ListTile(
                      title: Text('Email: $email'),
                      subtitle: Text('Tipo de Conta: $tipoConta'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          if (statusConta == 'INATIVA') {
                            _exibirDialog(
                              context,
                              document.id,
                              'ATIVA',
                              'Ativar a Conta',
                            );
                          } else {
                            _exibirDialog(
                              context,
                              document.id,
                              'INATIVA',
                              'Inativar a Conta',
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: statusConta == 'INATIVA'
                              ? Colors.green // Botão verde se estiver inativo
                              : null,
                        ),
                        child: Text(
                          statusConta == 'INATIVA' ? 'ATIVAR' : 'INATIVAR',
                        ),
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

  Future<void> _exibirDialog(
      BuildContext context, String documentId, String novoStatus, String acao) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar $acao'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Deseja realmente $acao esta conta?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o dialog sem fazer nada
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                _alterarStatusConta(documentId, novoStatus);
                Navigator.of(context).pop(); // Fecha o dialog após inativar a conta
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _alterarStatusConta(String documentId, String novoStatus) async {
    try {
      await FirebaseFirestore.instance
          .collection('usuarios') // ou 'preCadastro'
          .doc(documentId)
          .update({'statusConta': novoStatus});
      // Atualiza a lista após a alteração
      // Pode ser necessário chamar setState() se a atualização não for refletida automaticamente.
    } catch (e) {
      print('Erro ao alterar status da conta: $e');
    }
  }
}
