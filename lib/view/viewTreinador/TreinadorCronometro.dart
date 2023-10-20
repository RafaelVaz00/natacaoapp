import 'dart:async';

import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAtleta/HomeAtleta.dart';
import 'package:natacaoapp/view/viewTreinador/HomeTreinador.dart';

import '../viewAtleta/AtletaRegistroTreino.dart';

class TreinadorCronometro extends StatelessWidget {
  const TreinadorCronometro({super.key});

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

class _NavigationState extends State<Navigation> {
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
          color: Color(0xFFFEEEEE),
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
                              MaterialPageRoute(builder: (context) => HomeTreinador()),
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
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Essa tela ainda será implementada', style: TextStyle(color: Colors.white)),
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
