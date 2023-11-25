import 'dart:async';

import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAtleta/HomeAtleta.dart';

import '../viewAtleta/AtletaRegistroTreino.dart';


class AtletaCronometro extends StatefulWidget {
  const AtletaCronometro({super.key});

  @override
  State<AtletaCronometro> createState() => _AtletaCronometro();
}

class _AtletaCronometro extends State<AtletaCronometro> {
  int paginaAtual = 0;

  int millisegundos=0, segundos= 0, minutos = 0, horas= 0;
  String StringMillisegundos = "000", StringSegundos = "00", StringMinutos= "00", StringHoras="0";
  Timer? tempo;
  bool iniciado = false;

  List voltas = [];


  void parar(){
    tempo!.cancel();
    setState(() {
      iniciado= false;
    });
  }

  void reiniciar(){
    tempo!.cancel();
    setState(() {
      millisegundos=0;
      segundos=0;
      minutos= 0;
      horas = 0;


      StringMillisegundos = "000";
      StringSegundos = "00";
      StringMinutos= "00";
      StringHoras="0";

      iniciado = false;
      voltas.clear();
    });
  }

  void adicionarVolta(){
    String volta = "$StringHoras:$StringMinutos:$StringSegundos:$millisegundos";
    setState(() {
      voltas.add(volta);
    });
  }

  void iniciar(){
    iniciado = true;
    tempo = Timer.periodic(
            (Duration(milliseconds: 1)),
            (timer) {
             int millisegundosInterno = millisegundos + 3;
             int segundosInterno = segundos;
             int minutosInterno = minutos;
             int horasInterno = horas;

             millisegundos++;

              if(millisegundosInterno >= 999) {
                segundosInterno++;
                millisegundosInterno = 0;
                if (segundosInterno > 59) {
                  minutosInterno++;
                  segundosInterno = 0;
                  if (minutosInterno > 59) {
                    horasInterno++;
                    minutosInterno = 0;
                  }
                }
              }

             setState(() {
               millisegundos= millisegundosInterno;
               segundos = segundosInterno;
               minutos = minutosInterno;
               horas = horasInterno;

               StringMillisegundos = (millisegundos >=10) ? "$millisegundos" : "0$millisegundos";
               StringSegundos = (segundos >=10) ? "$segundos" : "0$segundos";
               StringMinutos = (minutos >=10) ?"$minutos": "0$minutos";
               StringHoras = (horas >=10) ? "$horas" : "0$horas";

             });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          color: Color(0xFFEEF8FE),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    "$StringHoras:$StringMinutos:$StringSegundos:$StringMillisegundos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFF323F68),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: ListView.builder(
                      itemCount: voltas.length,
                    itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Volta ${index+1}", style: TextStyle(color: Colors.white, fontSize: 16)),
                              Text("${voltas[index]}", style: TextStyle(color: Colors.white, fontSize: 16))
                            ],
                          ),
                        );
                    }
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: RawMaterialButton(
                      onPressed: (){
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              color: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text('Batimentos Cardíacos'),
                                    TextField(
                                      keyboardType: TextInputType.number, // Campo de entrada numérico
                                      decoration: InputDecoration(
                                        labelText: 'Início do Treino',
                                      ),
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.number, // Campo de entrada numérico
                                      decoration: InputDecoration(
                                        labelText: 'Final do Treino',
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: const Text('fechar'),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      shape: const StadiumBorder(
                          side:BorderSide(color: Colors.black)
                      ),
                      child: Text(
                      'Editar Informações',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                ),],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: RawMaterialButton(
                      onPressed: (){
                        (!iniciado) ? iniciar() : parar();
                      },
                      shape: const StadiumBorder(
                        side:BorderSide(color: Colors.black)
                      ),
                          child: Text(
                            (!iniciado) ? 'Começar': 'Pausar',
                            style: TextStyle(color: Colors.black),
                          ),
                    )
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: RawMaterialButton(
                      onPressed: (){
                      adicionarVolta();
                      },
                      child: Icon(Icons.flag, color: Colors.red, size: 50,)),
                      ),
                    Expanded(
                        child: RawMaterialButton(
                          onPressed: (){
                            reiniciar();
                          },
                          shape: const StadiumBorder(
                              side:BorderSide(color: Colors.black)
                          ),
                          child: Text(
                            'Reiniciar',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: RawMaterialButton(
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => HomeAtleta()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          shape: const StadiumBorder(
                              side:BorderSide(color: Colors.black)
                          ),
                          child: Text(
                           'Salvar',
                            style: TextStyle(color: Colors.black),
                          ),
                        )

                ),
                  ],
                ),
               ],
            ),
          ),
        ),
    );
  }
}
