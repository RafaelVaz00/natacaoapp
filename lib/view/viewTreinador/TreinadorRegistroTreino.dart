import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAtleta/AtletaCronometro.dart';
import 'package:natacaoapp/view/viewTreinador/TreinadorCronometro.dart';


class TreinadorRegistroTreino extends StatefulWidget {
  const TreinadorRegistroTreino({super.key});

  @override
  State<TreinadorRegistroTreino> createState() => _TreinadorRegistroTreinoState();
}

class PessoaContaItem {

  final String name;

  PessoaContaItem(this.name);

}

class ListaPessoas extends StatefulWidget{
  @override
  _ListaContasState createState() => _ListaContasState();
}

class _ListaContasState extends State<ListaPessoas> {
  List<PessoaContaItem> items = [
    PessoaContaItem('Rafael Vaz da Costa'),
    PessoaContaItem('Diego Brino'),
    PessoaContaItem('Matheus Rigolão'),
    PessoaContaItem('Matheus Rigolão'),
    PessoaContaItem('Matheus Rigolão'),
    PessoaContaItem('Matheus Rigolão'),
    PessoaContaItem('Matheus Rigolão'),
    PessoaContaItem('Matheus Rigolão'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => TreinadorCronometro()),
                  (Route<dynamic> route) => false,
            );
          },
          child: Card(
            margin: EdgeInsets.only(top: 15),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: 8,
                      children: [
                        Text(
                          items[index].name,
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            elevation: 1,
          ),
        );
      },
    );
  }
}

class _TreinadorRegistroTreinoState extends State<TreinadorRegistroTreino> {

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          color: Color(0xFFFEEEEE),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selecione um atleta',
                  style: TextStyle(fontSize: 32, ),
                ),
                Container(
                    constraints: BoxConstraints(maxHeight: 450),
                    child: ListaPessoas()
                ),
              ],
            ),
          ),
        ),
    );
  }
}
