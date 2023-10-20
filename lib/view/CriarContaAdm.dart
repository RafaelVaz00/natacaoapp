import 'package:flutter/material.dart';
import 'package:natacaoapp/view/HomeAdm.dart';

class CriarContaAdm extends StatelessWidget {
  const CriarContaAdm({super.key});

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
  final String? tipoConta = 'Administrador';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0xFF181818), Color(0xFFFCC9AC)],
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
              Image.asset(
                'lib/view/shared/gatobaiano.png',
                scale: 1.0,
                width: 50,
              )
            ]),
      ),
    );
  }
}

class ContaBase{

  String? nome;
  String? email;
  String? tipoConta;
  String? senha;

  ContaBase(){

  }

}

class _NavigationState extends State<Navigation> {
  int paginaAtual = 0;

  List<String> _tipoConta = <String>['Atleta', 'Administrador', 'Treinador'];
  String? _tipoContaSelecionado;

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tipoContaController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  var conta = ContaBase();

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
          color: Color(0xFFFEF7EE),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastre uma Conta',
                  style: TextStyle(fontSize: 28, ),
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,20,0,20),
                    child: TextFormField(
                      controller: nomeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                          labelText: 'Nome',
                          fillColor: Color(0xFFFFFFFF),
                          filled: true
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                          return "Nome é obrigatório!";
                          }
                          return null;
                          },
                      ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,20),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        fillColor: Color(0xFFFFFFFF),
                        filled: true
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                        return "Nome é obrigatório!";
                        }
                        return null;
                        },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,20),
                  child: DropdownButtonFormField<String>(
                    value: _tipoContaSelecionado,
                    items: _tipoConta.map((String item){
                      return DropdownMenuItem<String>(
                        value: item, child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? novoValor){
                      setState(() {
                        _tipoContaSelecionado = novoValor;
                      });
                    },
                      decoration: InputDecoration(
                        labelText: 'Tipo da conta'
                      ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,20),
                  child: TextFormField(
                    controller: senhaController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                        fillColor: Color(0xFFFFFFFF),
                        filled: true
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Nome é obrigatório!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(362, 50),
                          primary: Color(0xFFf2ad2c)
                      ),
                      onPressed: () {

                        conta.nome = nomeController.text;
                        conta.email = emailController.text;
                        conta.senha = senhaController.text;

                        print(conta.nome.toString());
                        print(conta.email.toString());
                        print(conta.senha.toString());

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeAdm()),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        'Criar conta',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                )
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
