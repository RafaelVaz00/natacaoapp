import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/Avaliacao.dart'; // Certifique-se de importar corretamente o modelo Avaliacao

class VisualizarMeusTreinos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Avaliações'),
      ),
      body: _buildListaAvaliacoes(context),
    );
  }

  Widget _buildListaAvaliacoes(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('avaliacao').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Avaliacao> avaliacoes = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Avaliacao(
            atletaId: data['atletaId'],
            treinoId: data['treinoId'],
            batimentosIniciais: data['batimentosIniciais'],
            batimentosFinais: data['batimentosFinais'],
            dataTreino: (data['dataTreino'] as Timestamp).toDate(),
            dataAvaliacao: (data['dataAvaliacao'] as Timestamp).toDate(),
            voltas: data['voltas'] != null ? List.from(data['voltas']) : [],
          );
        }).toList();

        return ListView.builder(
          itemCount: avaliacoes.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                _mostrarDetalhesAvaliacao(context, avaliacoes[index]);
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text('Data do Avaliação: ${avaliacoes[index].dataAvaliacao}'),
                  subtitle: Text('Treino: ${avaliacoes[index].treinoId}'),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _mostrarDetalhesAvaliacao(BuildContext context, Avaliacao avaliacao) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalhes da Avaliação'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              children: [
                _buildDetalhe('Atleta', avaliacao.atletaId),
                _buildDetalhe('Treino', avaliacao.treinoId),
                _buildDetalhe('Batimentos Iniciais', avaliacao.batimentosIniciais.toString()),
                _buildDetalhe('Batimentos Finais', avaliacao.batimentosFinais.toString()),
                _buildDetalhe('Data do Treino', _formatarData(avaliacao.dataTreino)),
                _buildDetalhe('Data da Avaliação', _formatarData(avaliacao.dataAvaliacao)),
                _buildDetalhe('Voltas', avaliacao.voltas!.join(', ')),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetalhe(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$titulo: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(valor),
          ),
        ],
      ),
    );
  }

  String _formatarData(DateTime data) {
    return "${data.day}/${data.month}/${data.year}"
        // " ${data.hour}:${data.minute}"
    ;
  }

}
