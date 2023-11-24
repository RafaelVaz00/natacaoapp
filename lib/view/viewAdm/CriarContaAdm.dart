import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAdm/HomeAdm.dart';

class CriarContaAdm extends StatefulWidget {
  const CriarContaAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Navigation());
  }

  @override
  State<CriarContaAdm> createState() => _CriarContaAdmState();
}

class ContaBase{

  String? nome;
  String? email;
  String? tipoConta;
  String? senha;

  ContaBase(){

  }

}

class _CriarContaAdmState extends State<CriarContaAdm> {
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
      body: Container(
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

    );
  }
}
