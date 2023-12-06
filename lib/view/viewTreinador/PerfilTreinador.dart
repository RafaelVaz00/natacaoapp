import 'package:flutter/material.dart';

class PerfilTreinador extends StatefulWidget {
  const PerfilTreinador({super.key});

  @override
  State<PerfilTreinador> createState() => _PerfilTreinadorState();
}


class _PerfilTreinadorState extends State<PerfilTreinador> {

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
                                'Alterar email e senha',
                                style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Atualize seus dados como email e senha',
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
    );
  }
}