import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAdm/CriarContaAdm.dart';
import 'package:natacaoapp/view/viewAdm/VisualizarContasAdm.dart';
// import 'package:natacaoapp/view/BarraSuperiorLayout.dart';
import 'package:natacaoapp/controller/UsuarioController.dart';

import '../BarraSuperiorLayout.dart';

UsuarioController usuarioController = new UsuarioController();

class HomeAdm extends StatelessWidget {
  const HomeAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Navigation());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});


  @override
  State<Navigation> createState() => _NavigationState();
}

// class PerfilSuperior extends StatefulWidget {
//   const PerfilSuperior({super.key});
//
//   @override
//   State<PerfilSuperior> createState() => _PerfilSuperior();
// }
//
// class _PerfilSuperior extends State<PerfilSuperior> {
//   final String? name = 'RAFAEL VAZ';
//   final String? tipoConta = 'Administrador';
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 1,
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//             colors: [Color(0xFF181818), Color(0xFFFCC9AC)],
//           )),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Bem vindo(a), $tipoConta',
//                       style: const TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                     Text('$name',
//                         style: const TextStyle(fontSize: 16, color: Colors.white))
//                   ]),
//               const Image(
//                 width: 50,
//                 height: 50,
//                 image: NetworkImage(
//                     'https://static.vecteezy.com/system/resources/thumbnails/002/318/271/small/user-profile-icon-free-vector.jpg'),
//               )
//             ]),
//       ),
//     );
//   }
// }



class _NavigationState extends State<Navigation> {

  int paginaAtual = 0;

  Future<String?> _obterNomeUsuario() async {
    String? nomeUsuario =  await usuarioController.obterNomeUsuario();

    return nomeUsuario ?? "";
  }

  Future<String?> _obterTipoConta() async {
    String? tipoConta =  await usuarioController.obterTipoConta() ;

    return tipoConta  ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: BarraSuperiorLayout(getName: _obterNomeUsuario, getTipoConta: _obterTipoConta),
        // flexibleSpace: PerfilSuperior() ,
        toolbarHeight: MediaQuery.of(context).size.height*0.18,
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            paginaAtual = index;
          });
        },
        indicatorColor: Colors.white,
        selectedIndex: paginaAtual,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_2_outlined),
            label: 'Perfil',
          )
        ],
      ),
      body: <Widget>[
        Container(
          color: Color(0xFFFEF7EE),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inicio',
                  style: TextStyle(fontSize: 32, ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => VisualizarContasAdm()),
                          (Route<dynamic> route) => false,
                    );
                  },
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
                                    'Visualizar Contas',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Veja a lista de todas as contas registradas',
                                    style: TextStyle( fontSize: 12),
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    elevation: 1,
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => CriarContaAdm()),
                          (Route<dynamic> route) => false,
                    );
                },
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
                                    'Criar uma Conta',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Crie uma conta com um perfil de Atleta, Treinador ou administrador',
                                    style: TextStyle( fontSize: 12),
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    elevation: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Color(0xFFFEF7EE),
          alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perfil',
                    style: TextStyle(fontSize: 32, ),
                  ),
                  InkWell(
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
                                      style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                    Text(
                                      'Atualize seus dados como nome, email, dentre outros.',
                                      style: TextStyle( fontSize: 12),
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      elevation: 1,
                    ),
                  ),
                ],
              ),
            ),
        ),
      ][paginaAtual],
    );
  }
}
