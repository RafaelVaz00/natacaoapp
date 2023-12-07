import 'package:flutter/material.dart';
import 'package:natacaoapp/controller/UsuarioController.dart';
import '../../RotaLogin.dart';
import '../../main.dart';

class MenuPerfilAdm extends StatefulWidget {
  const MenuPerfilAdm({Key? key}) : super(key: key);

  @override
  State<MenuPerfilAdm> createState() => _MenuPerfilAdmState();
}

class _MenuPerfilAdmState extends State<MenuPerfilAdm> {
  UsuarioController usuarioController = UsuarioController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              ElevatedButton(
                onPressed: () async {
                  // Desautentica o usuário no Firebase
                  usuarioController.desconectarUsuarioAtual();

                  // Remove todas as rotas da pilha e adiciona a rota de login
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => RotaLogin()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Text('Sair da Conta'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
