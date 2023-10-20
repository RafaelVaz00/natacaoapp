import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAdm/HomeAdm.dart';
import 'package:natacaoapp/view/viewAtleta/HomeAtleta.dart';
import 'package:natacaoapp/view/viewTreinador/HomeTreinador.dart';
import 'package:natacaoapp/view/viewTreinador/VisualizarContasTreinador.dart';


void main() {
  runApp(MaterialApp(home: const RotaLogin()));
}

class RotaRecuperacaoSenha extends StatelessWidget{
  const RotaRecuperacaoSenha({super.key});

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
                  padding: EdgeInsets.fromLTRB(35,15,35,0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(320, 50),
                        primary: Color(0xFF4461F2)
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Recebe Email',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),),
              ],
            ),
          ),
        )
    );
  }

}


class RotaLogin extends StatelessWidget {
  const RotaLogin({super.key});


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
                            MaterialPageRoute(builder: (context) => HomeTreinador()),
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
    )
    );
  }
}


