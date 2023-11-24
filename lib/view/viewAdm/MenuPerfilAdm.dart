import 'package:flutter/material.dart';

class MenuPerfilAdm extends StatefulWidget {
  const MenuPerfilAdm({super.key});

  @override
  State<MenuPerfilAdm> createState() => _MenuPerfilAdmState();
}


class _MenuPerfilAdmState extends State<MenuPerfilAdm> {

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
                                'Atualize seus dados como nome, email, dentre outros.',
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