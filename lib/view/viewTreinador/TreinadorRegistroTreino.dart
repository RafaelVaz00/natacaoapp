import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:natacaoapp/view/shared/layouts/RegistroTreinoExpanded.dart';

import '../../model/Treino.dart';


class TreinadorRegistroTreino extends StatefulWidget {
  @override
  _TreinadorRegistroTreinoState createState() => _TreinadorRegistroTreinoState();
}

class _TreinadorRegistroTreinoState extends State<TreinadorRegistroTreino> {
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
        title: Text('Criação de Treino'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Data',
                  border: OutlineInputBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      selectedDate != null
                          ? "${selectedDate!.toLocal()}".split(' ')[0]
                          : "Selecione a data",
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _adicionarTreino();
              },
              child: Text('Adicionar Treino'),
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: _buildListaTreinos(),
            ),
          ],
        ),
      ),
    );
  }

  void _adicionarTreino() {
    if (selectedDate == null) {
      return;
    }

    String descricao = descricaoController.text.trim();

    if (descricao.isNotEmpty) {
      Treino treino = Treino(
        data: selectedDate!,
        descricao: descricao,
        idTreino: '',
      );


      DocumentReference docRef =
      _firestore.collection('treinos').doc();
      docRef.set({
        'data': Timestamp.fromDate(treino.data),
        'descricao': treino.descricao,
        'idTreino': docRef.id,
      });

      setState(() {
        selectedDate = null;
      });

      descricaoController.clear();
    }
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
                  title: Text('Data: ${DateFormat('dd/MM/yyyy').format(treinos[index].data.toLocal())}'),
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