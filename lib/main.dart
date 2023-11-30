import 'package:flutter/material.dart';
import 'package:natacaoapp/controller/AdministradorController.dart';
import 'package:natacaoapp/view/shared/layouts/Home.dart';
import 'package:natacaoapp/controller/LoginController.dart';
import 'package:email_validator/email_validator.dart';

import 'model/Usuario.dart';

void main() {
  runApp(MaterialApp(home: const RotaLogin()));
  loginController.iniciarFireBase();
}

LoginController loginController = new LoginController();

class RotaLogin extends StatelessWidget {
  const RotaLogin({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Material(
                    color: Colors.white,
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Column(
                              children: [
                                Image.asset('lib/view/shared/assets/logounaerp.png',
                                  scale: 1.0,
                                  width: 240,
                                ),
                                const FormularioLogin(),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(180,20,35,35),
                                  child: Column(
                                    children: [
                                      Text('Não consegue se conectar?'),
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const RotaRecuperacaoSenha())
                                          );
                                        },
                                          child: Text(
                                            'Recupere sua senha!',
                                            style: TextStyle(
                                              color: Color(0xFF4461F2)
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                  ),
                              ],
                            ),
                          ),
          ),
        ),
      ),
    );
  }
}

class FormularioLogin extends StatefulWidget{
  const FormularioLogin({super.key});

  @override
  FormularioLoginState createState(){
    return FormularioLoginState();
  }
}

class FormularioLoginState extends State<FormularioLogin> {

  final _formKey = GlobalKey<FormState>();
  final emailLogin = TextEditingController();
  final senhaLogin = TextEditingController();

  @override
  void dispose(){
    emailLogin.dispose();
    senhaLogin.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(35,100,35,15),
            child: TextFormField(
              controller: emailLogin,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Insira seu email',
                fillColor: Color(0xFFEAF0F7),
                filled: true,
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Insira um email';
                }
                if(!EmailValidator.validate(value)){
                  return 'Insira um email válido!';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35,5,35,0),
            child: TextFormField(
              obscureText: true,
              controller: senhaLogin,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Insira sua senha',
                fillColor: Color(0xFFEAF0F7),
                filled: true,
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Insira uma senha!';
                }
                if(value.length < 6){
                  return 'O tamanho da senha é inválido!';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35,30,35,0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 50),
                  primary: Color(0xFF4461F2)
              ),
              onPressed: () async {
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                      content: Text('Verificando credenciais...'),
                        duration: Duration(seconds: 2),
                      )
                  );
                  }

                // A lógica funciona da seguinte maneira, primeiro irá verificar se existe algum usuario
                // na collection de pré cadastro com os campos email e senha, e se está com a flag de primeiro
                // acesso marcada, caso exista registro nessas condições, a lógica irá proceder com o cadastro
                // do usuario com aqueles dados encontrados de email e senha no firebase authentication, após isso
                // o usuario é autenticado, e é feito uma nova verificação, fazendo com que os registros do pré cadastro
                // sejam copiados para o documento de usuario de fato, e é feito a deleção do pré cadastro para economizar
                // espaço. Atenção: atualmente essa logica está funcionando apenas com a regra do banco permitindo a leitura
                // e gravação sem estar autenticado.

                Usuario? usuarioPrimeiroAcesso = await loginController
                    .verificarFlagPA(emailLogin.text, senhaLogin.text);

                if(usuarioPrimeiroAcesso?.flagPA==true){
                  AdministradorController administradorController = new AdministradorController();


                  administradorController.cadastrarUsuarioEmailSenha(emailLogin.text, senhaLogin.text);
                  loginController.realizarLogin(emailLogin.text, senhaLogin.text);
                  administradorController.criarDocumentoUsuarioPrimeiroAcesso(usuarioPrimeiroAcesso);


                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                        (Route<dynamic> route) => false,
                  );

                } else{
                  loginController.realizarLogin(emailLogin.text, senhaLogin.text);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                        (Route<dynamic> route) => false,
                  );
                }




                },
              child: Text(
                'Entrar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RotaRecuperacaoSenha extends StatefulWidget{
  const RotaRecuperacaoSenha({super.key});

  @override
  RotaRecuperacaoSenhaState createState(){
    return RotaRecuperacaoSenhaState();
  }
}

class RotaRecuperacaoSenhaState extends State<RotaRecuperacaoSenha>{

  final _formKeyRS = GlobalKey<FormState>();
  final emailRecuperacao = TextEditingController();


  @override
  void dispose(){
    emailRecuperacao.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
            body: SingleChildScrollView(
              child: Material(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.only(top: 130),
                  child: Column(
                    children: [
                      Image.asset('lib/view/shared/assets/logounaerp.png',
                        scale: 1.0,
                        width: 270,
                      ),
                      Form(
                        key: _formKeyRS,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(35,100,35,15),
                          child: TextFormField(
                            controller: emailRecuperacao,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Insira seu email',
                              fillColor: Color(0xFFEAF0F7),
                              filled: true,
                            ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Insira um email';
                                }
                                if(!EmailValidator.validate(value)){
                                  return 'Insira um email válido!';
                                }
                                return null;
                              }
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(35,15,35,0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(320, 50),
                              primary: Color(0xFF4461F2)
                          ),
                          onPressed: () {
                            if(_formKeyRS.currentState!.validate()) {
                              //email sendo enviado, porém há falhas as vezes, e a tela não volta após o sucesso.
                              try {
                                if (loginController.enviarEmailRedefinicaoSenha(emailRecuperacao.text) == true) {
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('O envio falhou!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              } catch(e){ print(e);}
                            }
                          },
                          child: Text(
                            'Recebe Email',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

}






