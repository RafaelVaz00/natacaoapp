import 'package:flutter/material.dart';

class VisualizarContasTreinador extends StatelessWidget {
  const VisualizarContasTreinador({super.key});

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
  final String? tipoConta = 'Treinador';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xFF181818), Color(0xFFFCACAC)],
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
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Text(
                          items[index].name,
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                        ),
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
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_2_outlined),
            label: 'Perfil',
          )
        ],
      ),
      body: <Widget>[
        Container(
          color: Color(0xFFFEEEEE),
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
        ),
        Container(
          color: Color(0xFFFEEEEE),
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
