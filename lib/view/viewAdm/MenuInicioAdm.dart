import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAdm/CriarContaAdm.dart';
import 'package:natacaoapp/view/viewAdm/VisualizarContasAdm.dart';

class MenuInicioAdm extends StatefulWidget {
  const MenuInicioAdm({super.key});

  @override
  State<MenuInicioAdm> createState() => _MenuInicioAdmState();
}


class _MenuInicioAdmState extends State<MenuInicioAdm> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFEF7EE),
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inicio',
              style: TextStyle(fontSize: 32,),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VisualizarContasAdm())
                );
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
                                'Visualizar Contas',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Veja a lista de todas as contas registradas',
                                style: TextStyle(fontSize: 12),
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CriarContaAdm())
                );
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
                                'Criar uma Conta',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Crie uma conta com um perfil de Atleta, Treinador ou administrador',
                                style: TextStyle(fontSize: 12),
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
    );
  }
}