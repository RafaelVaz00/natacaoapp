import 'package:flutter/material.dart';
import 'package:natacaoapp/view/CriarContaAdm.dart';
import 'package:natacaoapp/view/HomeAdm.dart';
import 'package:natacaoapp/view/HomeAtleta.dart';

void main() {
  runApp(MaterialApp(home: const TelaInicial()));
}

class _RedirecionarRecuperacaoSenha extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}


class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
      color: Colors.white,
          child: Container(
            margin: EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Image.asset('lib/view/shared/logounaerp.png',
                  scale: 1.0,
                  width: 270,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35,100,35,15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Insira seu email',
                      fillColor: Color(0xFFEAF0F7),
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35,5,35,0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Insira sua senha',
                        fillColor: Color(0xFFEAF0F7),
                        filled: true,
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
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomeAdm()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: Text(
                            'Entrar',
                          style: TextStyle(fontSize: 18),
                  ),
            ),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(180,20,35,35),

                  child: Column(
                    children: [
                      Text('Não consegue se conectar?'),
                      InkWell(
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
    )
    );
  }
}


