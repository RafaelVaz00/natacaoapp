import 'package:flutter/material.dart';
import 'package:natacaoapp/controller/AdministradorController.dart';
import 'package:natacaoapp/view/shared/layouts/Home.dart';

class CriarContaAdm extends StatefulWidget {
  const CriarContaAdm({super.key});

  @override
  State<CriarContaAdm> createState() => _CriarContaAdmState();
}

AdministradorController administradorController = new AdministradorController();

class _CriarContaAdmState extends State<CriarContaAdm> {

  List<String> _tipoConta = <String>['ATLETA', 'ADMINISTRADOR', 'TREINADOR'];
  String? _tipoContaSelecionado;

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tipoContaController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: Color(0xFFFEF7EE),
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10,60,10,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastre uma Conta',
                    style: TextStyle(fontSize: 28, ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,40,0,20),
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
                            primary: Color(0xFFF24444)
                        ),
                        onPressed: () {
                          administradorController.cadastroUsuario(
                              nomeController.text,
                              emailController.text,
                              _tipoContaSelecionado.toString(),
                              senhaController.text
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home())
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
