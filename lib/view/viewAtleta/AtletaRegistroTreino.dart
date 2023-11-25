import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAtleta/AtletaCronometro.dart';

class PessoaContaItem {

  final String name;

  PessoaContaItem(this.name);

}

class AtletaRegistroTreino extends StatefulWidget{
  const AtletaRegistroTreino({super.key});

  @override
  State<AtletaRegistroTreino> createState() => _AtletaRegistroTreinoState();
}

class _AtletaRegistroTreinoState extends State<AtletaRegistroTreino> {
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
    return Material(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AtletaCronometro()),
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
      ),
    );
  }
}
