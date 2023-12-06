import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../model/Treino.dart';
import '../../../model/Usuario.dart';
import 'Cronometro.dart';

class AtletaRegistroTreinoExpanded extends StatefulWidget {
  final Treino treino;

  AtletaRegistroTreinoExpanded({required this.treino});

  @override
  _AtletaRegistroTreinoExpandedState createState() =>
      _AtletaRegistroTreinoExpandedState();
}

class _AtletaRegistroTreinoExpandedState
    extends State<AtletaRegistroTreinoExpanded> {
  bool avaliacaoSalva = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Treino'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data: ${widget.treino.data.toLocal()}'),
            SizedBox(height: 16.0),
            Text('Descrição: ${widget.treino.descricao}'),
            SizedBox(height: 16.0),
            Text('Atletas vinculados ao treino:'),
            Expanded(
              child: _buildListaAtletas(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListaAtletas() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('usuarios')
          .where('tipoConta', isEqualTo: 'ATLETA')
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Usuario> atletas = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Usuario(
            idDocumento: data ['idDocumento'],
            nome: data['nome'],
            tipoConta: data['tipoConta'],
          );
        }).toList();

        return ListView.builder(
          itemCount: atletas.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text('Nome: ${atletas[index].nome}'),
                subtitle: Text('Tipo de Conta: ${atletas[index].tipoConta}'),
                onTap: () {
                  if (!avaliacaoSalva) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AtletaCronometro(
                          treinoId: widget.treino.idTreino,
                          atletaId: atletas[index].idDocumento,
                          data: widget.treino.data,
                          onAvaliacaoSalva: () {
                            setState(() {
                              avaliacaoSalva = true;
                            });
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}


