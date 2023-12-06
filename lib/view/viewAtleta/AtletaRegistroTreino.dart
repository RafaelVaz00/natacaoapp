import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:natacaoapp/view/shared/layouts/RegistroTreinoExpanded.dart';

import '../../model/Treino.dart';


class AtletaRegistroTreino extends StatefulWidget {
  @override
  _RegistroTreinoState createState() => _RegistroTreinoState();
}

class _RegistroTreinoState extends State<AtletaRegistroTreino> {
  DateTime? selectedDate;
  final TextEditingController descricaoController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Treino'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Selecione um treino para ver os atletas'),
            SizedBox(height: 32.0),
            Expanded(
              child: _buildListaTreinos(),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildListaTreinos() {
    return StreamBuilder(
      stream: _firestore.collection('treinos').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Treino> treinos = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Treino(
            data: (data['data'] as Timestamp).toDate(),
            descricao: data['descricao'],
            idTreino: data['idTreino'],
          );
        }).toList();

        return ListView.builder(
          itemCount: treinos.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AtletaRegistroTreinoExpanded(treino: treinos[index]),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text('Data: ${treinos[index].data.toLocal()}'),
                  subtitle: Text('Descrição: ${treinos[index].descricao}'),
                ),
              ),
            );
          },
        );
      },
    );
  }
}