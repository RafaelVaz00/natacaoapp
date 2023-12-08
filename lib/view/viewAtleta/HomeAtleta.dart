import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:natacaoapp/view/shared/layouts/Home.dart';
import 'package:natacaoapp/view/viewAtleta/AtletaRegistroTreino.dart';
import 'package:natacaoapp/view/viewAtleta/VisualizarMeusTreinos.dart';

class HomeAtleta extends StatefulWidget {
  const HomeAtleta({super.key});

  @override
  State<HomeAtleta> createState() => _HomeAtletaState();
}
class _HomeAtletaState extends State<HomeAtleta> {

  @override
  Widget build(BuildContext context) {
   return Container(
          color: Color(0xFFEEF8FE),
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inicio',
                  style: TextStyle(fontSize: 32, ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>VisualizarMeusTreinos())
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
                                    'Ver minhas avaliações ',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Veja a lista de todos as ultimas avaliações feitas nos seus treinos para acompanhar seu desempenho.',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AtletaRegistroTreino()));
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
                                    'Registrar Treino ',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Auxilie um colega atleta registrando os tempos dele de acordo com as métricas definidas previamente.',
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
                                    'Desempenho',
                                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    'Verifique seu desempenho através de gráficos comparativos entre diferentes atletas e modalidades. .',
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
                )
              ],
            ),
          ),
    );
  }
}

