import 'package:flutter/material.dart';

class VisualizarContasAdm extends StatefulWidget {
  const VisualizarContasAdm({super.key});

  @override
  State<VisualizarContasAdm> createState() => _VisualizarContasAdmState();
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
        return Card(
          margin: EdgeInsets.only(top: 15),
          child: Padding(
            padding: const EdgeInsets.all(5),
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
                      IconButton(
                        onPressed: () {
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          elevation: 1,
        );
      },
    );
  }
}

class _VisualizarContasAdmState extends State<VisualizarContasAdm> {
  int paginaAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Color(0xFFFEF7EE),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contas',
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
