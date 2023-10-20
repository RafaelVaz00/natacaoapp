import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAtleta/AtletaRegistroTreino.dart';

class HomeAtleta extends StatelessWidget {
  const HomeAtleta({super.key});

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

class PerfilSuperior extends StatefulWidget {
  const PerfilSuperior({super.key});

  @override
  State<PerfilSuperior> createState() => _PerfilSuperior();
}

class _PerfilSuperior extends State<PerfilSuperior> {
  final String? name = 'RAFAEL VAZ';
  final String? tipoConta = 'Atleta';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xFF181818), Color(0xFFACDFFB)],
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bem vindo(a), $tipoConta',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text('$name',
                        style: const TextStyle(fontSize: 16, color: Colors.white))
                  ]),
              const Image(
                width: 50,
                height: 50,
                image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/thumbnails/002/318/271/small/user-profile-icon-free-vector.jpg'),
              )
            ]),
      ),
    );
  }
}

class _NavigationState extends State<Navigation> {
  int paginaAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const PerfilSuperior(),
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
            selectedIcon: Icon(Icons.auto_graph),
            icon: Icon(Icons.auto_graph_outlined),
            label: 'Desempenho',
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
          color: Color(0xFFEEF8FE),
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
                                    'Ver Treinos ',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Veja a lista de todos os seus últimos treinos para verificar seu desempenho.',
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
                      MaterialPageRoute(builder: (context) => AtletaRegistroTreino()),
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
                                    'Registrar Treino ',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Auxilie um colega atleta registrando os tempos dele de acordo com as métricas definidas previamente.',
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
                    setState(() {
                      paginaAtual=1;
                    });
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
                                    'Desempenho',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Verifique seu desempenho através de gráficos comparativos entre diferentes atletas e modalidades. .',
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
                )
              ],
            ),
          ),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Essa tela ainda será implementada', style: TextStyle(color: Colors.white)),
        ),
        Container(
          color: Color(0xFFEEF8FE),
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
                                    'Atualize seus dados como: endereço, local de trabalho, convênio médico, dentre outros.',
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
                                    'Contato',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Atualize seus telefones de contato, tais como telefone da mãe, pai, telefones de emergência, dentre outros.',
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
                                    'Anexos',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Anexe arquivos, tais como atestados médicos, RG, CPF, comprovante de endereço, entre outros.',
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
