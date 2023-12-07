import 'package:flutter/material.dart';
import 'package:natacaoapp/view/shared/layouts/Home.dart';

import '../../controller/AdministradorController.dart';

class CriarContaTreinador extends StatefulWidget {
  final String documentId;

  const CriarContaTreinador({Key? key, required this.documentId})
      : super(key: key);

  @override
  State<CriarContaTreinador> createState() => _CriarContaTreinadorState();
}

class _CriarContaTreinadorState extends State<CriarContaTreinador> {
  AdministradorController administradorController =
  new AdministradorController();

  TextEditingController nomeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController naturalidadeController = TextEditingController();
  TextEditingController nacionalidadeController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  TextEditingController nomeMaeController = TextEditingController();
  TextEditingController nomePaiController = TextEditingController();
  TextEditingController cbOrigemController = TextEditingController();
  TextEditingController localTrabalhoController = TextEditingController();
  TextEditingController convenioMedicoController = TextEditingController();
  TextEditingController alergiController = TextEditingController();
  TextEditingController estilosController = TextEditingController();
  TextEditingController telefoneCelularController = TextEditingController();
  TextEditingController telefoneResidencialController = TextEditingController();
  TextEditingController telefoneTrabalhoController = TextEditingController();
  TextEditingController telefoneEmergenciaController = TextEditingController();
  TextEditingController telefonePaiController = TextEditingController();
  TextEditingController telefoneMaeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _loadPreCadastroData();
  }

  // void _loadPreCadastroData() async {
  //   Map<String, dynamic>? preCadastroData =
  //   await administradorController.getPreCadastroData(widget.documentId);
  //
  //   if (preCadastroData != null) {
  //     setState(() {
  //       nomeController.text = preCadastroData['nome'] ?? '';
  //       dataNascimentoController.text = preCadastroData['dataNascimento'] ?? '';
  //       // Continue para os demais campos...
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('Criação de conta')),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Container(
              color: Color(0xFFFEF7EE),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dados Pessoais',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
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
                  SizedBox(height: 20),
                  TextFormField(
                    controller: dataNascimentoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Data de Nascimento',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Data de Nascimento é obrigatória!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: naturalidadeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Naturalidade',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Naturalidade é obrigatória!";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: nacionalidadeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nacionalidade',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Nacionalidade é obrigatória!";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: rgController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'RG',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "RG é obrigatório!";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: cpfController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CPF',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "CPF é obrigatório!";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: sexoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Sexo',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Sexo é obrigatório!";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: enderecoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Endereço',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Endereço é obrigatório!";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: bairroController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Bairro',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Bairro é obrigatório!";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: cidadeController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Cidade',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Cidade é obrigatória!";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cepController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CEP',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "CEP é obrigatório!";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: ufController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'UF',
                            fillColor: Color(0xFFFFFFFF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "UF é obrigatória!";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: nomeMaeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome da mãe',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Nome é obrigatório!";
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: nomePaiController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome do Pai',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Nome é obrigatório!";
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: cbOrigemController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Clube de origem',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Nome é obrigatório!";
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: localTrabalhoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Local de Trabalho',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Nome é obrigatório!";
                    //   }
                    //   return null;
                    // },
                  ),

                  SizedBox(height: 20),
                  TextFormField(
                    controller: convenioMedicoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Convênio médico',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Convênio médico é obrigatório!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: alergiController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Alergia a medicamentos',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Nome é obrigatório!";
                    //   }
                    //   // Adicione a validação específica conforme necessário.
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: estilosController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Estilos de prova',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Estilos de prova são obrigatórios!";
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: telefoneCelularController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone Celular*',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Telefone Celular é obrigatório!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: telefoneResidencialController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone Residencial',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: telefoneTrabalhoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone Trabalho',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: telefoneEmergenciaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone de Emergência*',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Telefone de Emergência é obrigatório!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: telefonePaiController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone do Pai',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: telefoneMaeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone da Mãe',
                      fillColor: Color(0xFFFFFFFF),
                      filled: true,
                    ),
                  ),
                  // Continue para os demais campos...
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(362, 50),
                      primary: Color(0xFFF24444),
                    ),
                    onPressed: () {
                      _completarCadastro();
                    },
                    child: Text(
                      'Criar conta',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _completarCadastro() async {
    // Coleta os dados dos controllers
    String telefoneCelular = telefoneCelularController.text;
    String telefoneResidencial = telefoneResidencialController.text;
    String telefoneTrabalho = telefoneTrabalhoController.text;
    String telefoneEmergencia = telefoneEmergenciaController.text;
    String telefonePai = telefonePaiController.text;
    String telefoneMae = telefoneMaeController.text;
    // Continue para os demais campos...

    // Chama o método para completar o cadastro
    administradorController.completarCadastro(
      widget.documentId,
      nomeController.text,
      dataNascimentoController.text,
      naturalidadeController.text,
      nacionalidadeController.text,
      rgController.text,
      cpfController.text,
      sexoController.text,
      enderecoController.text,
      bairroController.text,
      cidadeController.text,
      ufController.text,
      cepController.text,
      nomeMaeController.text,
      nomePaiController.text,
      cbOrigemController.text,
      localTrabalhoController.text,
      convenioMedicoController.text,
      alergiController.text,
      estilosController.text,
      telefoneCelular,
      telefoneResidencial,
      telefoneTrabalho,
      telefoneEmergencia,
      telefonePai,
      telefoneMae,

    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
}
