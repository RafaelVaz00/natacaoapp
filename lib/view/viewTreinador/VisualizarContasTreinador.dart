import 'package:flutter/material.dart';
import 'package:natacaoapp/controller/AdministradorController.dart';

import '../../model/Usuario.dart';

class ListaContas extends StatefulWidget{
  final List<Usuario> usuarios;

  ListaContas({required this.usuarios});

  @override
  _ListaContasState createState() => _ListaContasState();
}

class _ListaContasState extends State<ListaContas> {
  bool _selected = false;
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.usuarios.length,
      itemBuilder: (context, index) {
        Usuario usuario = widget.usuarios[index];
        Card(child: ListTile(
          enabled: _enabled,
          selected: _selected,
          onTap: () {
            setState(() {
              _selected = !_selected;
            });
          },
          iconColor: MaterialStateColor.resolveWith((
              Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.red;
            }
            if (states.contains(MaterialState.selected)) {
              return Colors.green;
            }
            return Colors.black;
          }),
          textColor: MaterialStateColor.resolveWith((
              Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.red;
            }
            if (states.contains(MaterialState.selected)) {
              return Colors.green;
            }
            return Colors.black;
          }),
          leading: const Icon(Icons.person),
          title: Text(usuario.nome ?? ""),
          subtitle: Text('Enabled: $_enabled, Selected: $_selected'),
          trailing: Switch(
            onChanged: (bool? value) {
              // This is called when the user toggles the switch.
              setState(() {
                _enabled = value!;
              });
            },
            value: _enabled,
          ),

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

  late Future<List<Usuario>> _usuarios;

  @override
  void initState(){
    super.initState();
    _usuarios = administradorController.obterListaUsuarios();
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
                    'Contas',
                    style: TextStyle(fontSize: 32, ),
                  ),
                  FutureBuilder<List<Usuario>>(
                      future: _usuarios,
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
                            child: ListaContas(usuarios: snapshot.data!),
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
