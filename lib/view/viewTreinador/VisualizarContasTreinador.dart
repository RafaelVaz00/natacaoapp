import 'package:flutter/material.dart';
import 'package:natacaoapp/controller/AdministradorController.dart';

import '../../model/Atleta.dart';
import '../../model/Usuario.dart';

class ListaContas extends StatefulWidget{
  final List<Atleta> atletas;

  ListaContas({required this.atletas});

  @override
  _ListaContasState createState() => _ListaContasState();
}

class _ListaContasState extends State<ListaContas> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.atletas.length,
      itemBuilder: (context, index) {
        Atleta atleta = widget.atletas[index];
        return Card(
          child: ListTile(
          // enabled: _enabled,
          // selected: _selected,
          title: Text(atleta.nome),
          onTap: () {
            // setState(() {
            //   _selected = !_selected;
            // });
          },
          leading: const Icon(Icons.person),
        ),
        );

      },
    );
  }
}

class VisualizarContasTreinador extends StatefulWidget {
  const VisualizarContasTreinador({super.key});

  @override
  State<VisualizarContasTreinador> createState() => _VisualizarContasTreinadorState();
}

class _VisualizarContasTreinadorState extends State<VisualizarContasTreinador> {

  AdministradorController administradorController = new AdministradorController();

  late Future<List<Atleta>> _atletas;

  @override
  void initState(){
    super.initState();
    _atletas = administradorController.obterListaAtletas();
    print(_atletas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contas')),
        body: Container(
          color: Color(0xFFFEEEEE),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 60 , 5 , 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lista de atletas',
                    style: TextStyle(fontSize: 32, ),
                  ),
                  FutureBuilder<List<Atleta>>(
                      future: _atletas,
                      builder: (context, snapshot){
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Erro: ${snapshot.error}');
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('Nenhum usuário encontrado.');
                        } else {
                          return Container(
                            constraints: BoxConstraints(maxHeight: 450),
                            child: ListaContas(atletas: snapshot.data!),
                          );
                        }
                      },
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
