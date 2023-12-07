import 'package:flutter/material.dart';
import 'package:natacaoapp/controller/AdministradorController.dart';
import 'package:natacaoapp/view/shared/layouts/Home.dart';

class CriarContaAdm extends StatefulWidget {
  const CriarContaAdm({Key? key}) : super(key: key);

  @override
  State<CriarContaAdm> createState() => _CriarContaAdmState();
}

AdministradorController administradorController = new AdministradorController();

class _CriarContaAdmState extends State<CriarContaAdm> {
  List<String> _tipoConta = <String>['ATLETA', 'ADMINISTRADOR', 'TREINADOR'];
  String? _tipoContaSelecionado;

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastre uma Conta',
                  style: TextStyle(fontSize: 28),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child: TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nome é obrigatório!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email é obrigatório!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: DropdownButtonFormField<String>(
                    value: _tipoContaSelecionado,
                    items: _tipoConta.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? novoValor) {
                      setState(() {
                        _tipoContaSelecionado = novoValor;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Tipo da conta'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextFormField(
                    controller: senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Senha é obrigatória!";
                      } else if (value.length < 6) {
                        return "Senha deve ter pelo menos 6 caracteres!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(362, 50),
                        primary: Color(0xFFF24444)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        administradorController.cadastroUsuario(
                          nomeController.text,
                          emailController.text,
                          _tipoContaSelecionado.toString(),
                          senhaController.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }
                    },
                    child: Text(
                      'Criar conta',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
