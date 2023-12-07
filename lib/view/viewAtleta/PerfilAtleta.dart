import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAtleta/PerfilUploadArquivos.dart';

class PerfilAtleta extends StatefulWidget {
  const PerfilAtleta({super.key});

  @override
  State<PerfilAtleta> createState() => _PerfilAtletaState();
}


class _PerfilAtletaState extends State<PerfilAtleta> {

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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PerfilUploadArquivos())
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
    );
  }
}