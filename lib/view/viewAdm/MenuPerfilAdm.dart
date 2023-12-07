import 'package:flutter/material.dart';
import 'package:natacaoapp/controller/UsuarioController.dart';
import '../../main.dart';

class MenuPerfilAdm extends StatefulWidget {
  const MenuPerfilAdm({super.key});

  @override
  State<MenuPerfilAdm> createState() => _MenuPerfilAdmState();
}

class _MenuPerfilAdmState extends State<MenuPerfilAdm> {
  UsuarioController usuarioController = new UsuarioController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xFFFEF7EE),
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Perfil',
                style: TextStyle(fontSize: 32),
              ),
              Expanded(
                child: InkWell(
                  child: Card(
                    margin: EdgeInsets.only(top: 25),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              runSpacing: 8,
                              children: [
                                Text(
                                  'Dados Pessoais',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Text(
                                  'Atualize seus dados como nome, email, dentre outros.',
                                  style: TextStyle(fontSize: 12),
                                  softWrap: true,
                                  overflow: TextOverflow.clip,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    elevation: 1,
                  ),
                ),
              ),
              SizedBox(height: 16), // Espaçamento entre os cards e o botão

              // Botão para Sair da Conta
              FloatingActionButton(
                onPressed: () {
                  // Desautentica o usuário no Firebase
                  usuarioController.desconectarUsuarioAtual();

                  // Remove todas as rotas da pilha e adiciona a rota de login
                  Navigator.popUntil(context, (route) => route.isFirst);

                  // Navega para a tela de login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RotaLogin()),
                  );
                },
                child: Icon(Icons.exit_to_app),
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

