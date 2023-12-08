import 'package:flutter/material.dart';

import '../../RotaLogin.dart';
import '../shared/layouts/Home.dart';

class MenuPerfilAdm extends StatefulWidget {
  const MenuPerfilAdm({Key? key}) : super(key: key);

  @override
  State<MenuPerfilAdm> createState() => _MenuPerfilAdmState();
}

class _MenuPerfilAdmState extends State<MenuPerfilAdm> {
  TextEditingController inputController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf5ebe6),
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
            buildCard(
              'Trocar email',
              'Clique para enviar um email para troca de email',
            ),
            buildCard(
              'Recuperar senha',
              'Clique para enviar um email para troca de email',
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
                width: 0.8 * MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    // Desautentica o usuário no Firebase
                    usuarioController.desconectarUsuarioAtual();

                    // Remove todas as rotas da pilha e adiciona a rota de login
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RotaLogin()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Sair da Conta', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, String subtitle) {
    return InkWell(
      onTap: () {
        if (title == 'Trocar email') {
          _mostrarDialogTrocaEmail();
        }
        if (title == 'Recuperar senha') {
          _mostrarDialogRecuperarSenha();
        }
      },
      child: Card(
        margin: EdgeInsets.only(top: 25),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12),
                      softWrap: true,
                      overflow: TextOverflow.clip,
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
  }

  Future<void> _mostrarDialogRecuperarSenha() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Recuperar Senha'),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Reduz o espaçamento interno
          content: Column(
            mainAxisSize: MainAxisSize.min, // Reduz o tamanho vertical do conteúdo
            children: [
              TextFormField(
                controller: inputController,
                decoration: InputDecoration(labelText: 'Insira um email'),
              ),
            ],
          ),
          actionsPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Reduz o espaçamento interno das ações
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                usuarioController.enviarRecuperacaoSenha(inputController.text);
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Cor de fundo do botão Confirmar
              ),
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }



  Future<void> _mostrarDialogTrocaEmail() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alteração de Email'),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Reduz o espaçamento interno
          content: Column(
            mainAxisSize: MainAxisSize.min, // Reduz o tamanho vertical do conteúdo
            children: [
              TextFormField(
                controller: inputController,
                decoration: InputDecoration(labelText: 'Insira um Email'),
              ),
            ],
          ),
          actionsPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Reduz o espaçamento interno das ações
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                usuarioController.enviarRecuperacaoSenha(inputController.text);
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Cor de fundo do botão Confirmar
              ),
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

}
