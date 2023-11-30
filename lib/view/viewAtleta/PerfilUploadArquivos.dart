import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:natacaoapp/view/shared/layouts/Home.dart';

import '../../controller/AdministradorController.dart';

class PerfilUploadArquivos extends StatefulWidget {
  const PerfilUploadArquivos({super.key});

  @override
  State<PerfilUploadArquivos> createState() => _PerfilUploadArquivosState();

}


class _PerfilUploadArquivosState extends State<PerfilUploadArquivos> {

  AdministradorController administradorController = new AdministradorController();
  final storageRef= FirebaseStorage.instance.ref();
  late Reference storageAtletaRef;
  late Reference rgImagemRef;
  late Reference cpfImagemRef;
  late Reference comprovanteImagemRef;
  late Reference fotoImagemRef;
  late Reference regulamentoImagemRef;
  File? imageTemp;

 @override
 void initState(){
   super.initState();
   setupStorageAtletaRef();
 }

 Future<void> setupStorageAtletaRef() async {
   String? userId = await administradorController.obterUserID();
   setState(() {
     storageAtletaRef = storageRef.child(userId!);
     rgImagemRef= storageAtletaRef.child("Rg.jpg");
     cpfImagemRef = storageAtletaRef.child("Cpf.jpg");
     comprovanteImagemRef = storageAtletaRef.child("comprovante_endereco_ImagemRef.jpg");
     fotoImagemRef = storageAtletaRef.child("foto_perfil_imagem.jpg");
     regulamentoImagemRef= storageAtletaRef.child("regulamento_assinado.jpg");
   });
 }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      imageTemp = File(image.path);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Uploads'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Container(
              color: Color(0xFFFEF7EE),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 60, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload de Arquivos',
                      style: TextStyle(fontSize: 28,),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(362, 50),
                              primary: Color(0xFFF24444)
                          ),
                          onPressed: () async {
                            await pickImage();

                            try{
                              await rgImagemRef.putFile(imageTemp!);
                            } on Exception catch(e){
                              print(e);
                            }

                          },
                          child: Text(
                            'Selecione um RG',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(362, 50),
                              primary: Color(0xFFF24444)
                          ),
                          onPressed: () async {
                            await pickImage();

                            try{
                              await cpfImagemRef.putFile(imageTemp!);
                            } on Exception catch(e){
                              print(e);
                            }
                          },
                          child: Text(
                            'Selecione um CPF',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(362, 50),
                              primary: Color(0xFFF24444)
                          ),
                          onPressed: () async {
                            await pickImage();

                            try{
                              await comprovanteImagemRef.putFile(imageTemp!);
                            } on Exception catch(e){
                              print(e);
                            }
                          },
                          child: Text(
                            'Comprovante de residencia',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(362, 50),
                              primary: Color(0xFFF24444)
                          ),
                          onPressed: () async {
                            await pickImage();

                            try{
                              await fotoImagemRef.putFile(imageTemp!);
                            } on Exception catch(e){
                              print(e);
                            }
                          },
                          child: Text(
                            'Foto',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(362, 50),
                              primary: Color(0xFFF24444)
                          ),
                          onPressed: () async {
                            await pickImage();

                            try{
                              await regulamentoImagemRef.putFile(imageTemp!);
                            } on Exception catch(e){
                              print(e);
                            }
                          },
                          child: Text(
                            'Regulamento Assinado',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
