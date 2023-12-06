import 'package:flutter/material.dart';
import 'package:natacaoapp/view/shared/layouts/Home.dart';

import '../../controller/AdministradorController.dart';

class CriarContaTreinador extends StatefulWidget {
  const CriarContaTreinador({Key? key}) : super(key: key);

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
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(362, 50),
                      primary: Color(0xFFF24444),
                    ),
                    onPressed: () {
                      administradorController.completarCadastro(
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
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
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
}
