import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AtletaCronometro extends StatefulWidget {
  final String treinoId;
  final String atletaId;
  final DateTime data;
  final Function? onAvaliacaoSalva;

  const AtletaCronometro({
    Key? key,
    required this.treinoId,
    required this.atletaId,
    required this.data,
    this.onAvaliacaoSalva,
  }) : super(key: key);

  @override
  _AtletaCronometroState createState() => _AtletaCronometroState();
}

class _AtletaCronometroState extends State<AtletaCronometro> {
  int segundos = 0, minutos = 0, horas = 0, milissegundos = 0;
  Timer? tempo;
  bool iniciado = false;

  List<String> voltas = [];

  bool avaliacaoSalva = false;

  TextEditingController batimentosIniciaisController = TextEditingController();
  TextEditingController batimentosFinaisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronômetro'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color(0xFFEEF8FE),
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.0),
              Text(
                "${_formatarTempo()}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF323F68),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  itemCount: voltas.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Volta ${index + 1}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${voltas[index]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (!iniciado) {
                        _mostrarDialogBatimentosIniciais();
                      } else {
                        _pausar();
                      }
                    },
                    icon: Icon(iniciado ? Icons.pause : Icons.play_arrow),
                    label: Text(iniciado ? 'Pausar' : 'Iniciar'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (iniciado) {
                        _adicionarVolta();
                      }
                    },
                    icon: Icon(Icons.flag),
                    label: Text('Volta'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _reiniciar();
                    },
                    icon: Icon(Icons.replay),
                    label: Text('Reiniciar'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              if (avaliacaoSalva)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Voltar para Treinos'),
                ),
              if (!avaliacaoSalva)
                ElevatedButton(
                  onPressed: () {
                    _mostrarDialogBatimentosFinais();
                  },
                  child: Text('Salvar Avaliação'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogBatimentosIniciais() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Batimentos Cardíacos Iniciais'),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: batimentosIniciaisController,
            decoration: InputDecoration(
              labelText: 'Batimentos Iniciais',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _iniciar();
              },
              child: Text('Iniciar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDialogBatimentosFinais() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Batimentos Cardíacos Finais'),
          content: TextField(
            keyboardType: TextInputType.number,
            controller: batimentosFinaisController,
            decoration: InputDecoration(
              labelText: 'Batimentos Finais',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _salvarAvaliacao();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _iniciar() {
    iniciado = true;
    tempo = Timer.periodic(
      Duration(milliseconds: 100),
          (timer) {
        setState(() {
          milissegundos += 100;
          if (milissegundos == 1000) {
            segundos++;
            milissegundos = 0;
            if (segundos == 60) {
              minutos++;
              segundos = 0;
              if (minutos == 60) {
                horas++;
                minutos = 0;
              }
            }
          }
        });
      },
    );
  }

  void _adicionarVolta() {
    String volta = _formatarTempo();
    setState(() {
      voltas.add(volta);
    });
  }

  void _pausar() {
    tempo!.cancel();
    setState(() {
      iniciado = false;
    });
  }

  void _reiniciar() {
    tempo!.cancel();
    setState(() {
      milissegundos = 0;
      segundos = 0;
      minutos = 0;
      horas = 0;
      iniciado = false;
      voltas.clear();
    });
  }

  String _formatarTempo() {
    String minutosStr = minutos.toString().padLeft(2, '0');
    String segundosStr = segundos.toString().padLeft(2, '0');
    String milissegundosStr =
    (milissegundos ~/ 10).toString().padLeft(2, '0');
    return "$minutosStr:$segundosStr:$milissegundosStr";
  }

  void _salvarAvaliacao() async {
    String batimentosIniciais = batimentosIniciaisController.text;
    String batimentosFinais = batimentosFinaisController.text;

    if (widget.treinoId == null || widget.atletaId == null) {
      return;
    } else {

    // Obtém o documento de avaliação ou cria um novo
    DocumentReference avaliacaoRef = FirebaseFirestore.instance
        .collection('avaliacao')
        .doc();
    DocumentSnapshot avaliacaoSnapshot = await avaliacaoRef.get();

    Map<String, dynamic> avaliacaoData = {
      'treinoId': widget.treinoId,
      'atletaId': widget.atletaId,
      'voltas': voltas,
      'batimentosIniciais': int.parse(batimentosIniciais),
      'batimentosFinais': int.parse(batimentosFinais),
      'dataTreino': widget.data,
      'dataAvaliacao': FieldValue.serverTimestamp(),
    };

    if (avaliacaoSnapshot.exists) {
      // Atualiza a avaliação existente
      await avaliacaoRef.update(avaliacaoData);
    } else {
      // Cria uma nova avaliação
      await avaliacaoRef.set(avaliacaoData);
    }

    if (widget.onAvaliacaoSalva != null) {
      widget.onAvaliacaoSalva!();
    }
  }

    // Atualizar o estado para indicar que a avaliação foi salva
    setState(() {
      avaliacaoSalva = true;
    });

    // Chamar a função de callback se fornecida
    if (widget.onAvaliacaoSalva != null) {
      widget.onAvaliacaoSalva!();
    }

    // Fechar o modal
    Navigator.pop(context);

    // await FirebaseFirestore.instance
    //     .collection('usuarios')
    //     .doc(widget.atletaId)
    //     .collection('treinos')
    //     .doc(widget.treinoId)
    //     .set({'avaliacaoSalva': true}, SetOptions(merge: true));

  }

  @override
  void dispose() {
    batimentosIniciaisController.dispose();
    batimentosFinaisController.dispose();
    super.dispose();
  }
}
