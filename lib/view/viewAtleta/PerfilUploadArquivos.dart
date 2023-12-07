import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../controller/AdministradorController.dart';

class PerfilUploadArquivos extends StatefulWidget {
  const PerfilUploadArquivos({super.key});

  @override
  State<PerfilUploadArquivos> createState() => _PerfilUploadArquivosState();
}

class _PerfilUploadArquivosState extends State<PerfilUploadArquivos> {
  AdministradorController administradorController =
  new AdministradorController();
  final storageRef = FirebaseStorage.instance.ref();
  late Reference storageAtletaRef;
  late Reference rgImagemRef;
  late Reference cpfImagemRef;
  late Reference comprovanteImagemRef;
  late Reference fotoImagemRef;
  late Reference regulamentoImagemRef;

  File? imageTemp;

  String? rgImagemUrl;
  String? cpfImagemUrl;
  String? comprovanteImagemUrl;
  String? fotoImagemUrl;
  String? regulamentoImagemUrl;
  bool carregando = true;

  @override
  void initState() {
    setupStorageAtletaRef();
    super.initState();
  }

  Future<void> setupStorageAtletaRef() async {
    String? userId = await administradorController.obterUserID();

    setState(() {
      storageAtletaRef = storageRef.child(userId!);
      rgImagemRef = storageAtletaRef.child("Rg.jpg");
      cpfImagemRef = storageAtletaRef.child("Cpf.jpg");
      comprovanteImagemRef =
          storageAtletaRef.child("comprovante_endereco_ImagemRef.jpg");
      fotoImagemRef = storageAtletaRef.child("foto_perfil_imagem.jpg");
      regulamentoImagemRef = storageAtletaRef.child("regulamento_assinado.jpg");
    });

    String? regulamentoUrl;
    try {
      regulamentoUrl = await regulamentoImagemRef.getDownloadURL();
    } catch (e) {
      regulamentoUrl = "URL_Padrao_Aqui";
    }

    String? rgUrl;
    try {
      rgUrl = await rgImagemRef.getDownloadURL();
    } catch (e) {
      rgUrl = "URL_Padrao_Aqui";
    }

    String? cpfUrl;
    try {
      cpfUrl = await cpfImagemRef.getDownloadURL();
    } catch (e) {
      cpfUrl = "URL_Padrao_Aqui";
    }

    String? comprovanteUrl;
    try {
      comprovanteUrl = await comprovanteImagemRef.getDownloadURL();
    } catch (e) {
      comprovanteUrl = "URL_Padrao_Aqui";
    }

    String? fotoUrl;
    try {
      fotoUrl = await fotoImagemRef.getDownloadURL();
    } catch (e) {
      fotoUrl = "URL_Padrao_Aqui";
    }



    setState(() {
      rgImagemUrl = rgUrl;
      cpfImagemUrl = cpfUrl;
      comprovanteImagemUrl = comprovanteUrl;
      fotoImagemUrl = fotoUrl;
      regulamentoImagemUrl = regulamentoUrl;

      carregando = false;
    });

    print(rgImagemUrl);
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      imageTemp = File(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return carregando == true
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Anexos'),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Selecione os arquivos',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'Atenção: algumas imagens podem demorar serem carregadas, portanto aguarde alguns segundos.',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    rgImagemUrl != null
                        ? Image.network(
                      rgImagemUrl!,
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_to_photos_outlined),
                        Text("Faça upload da imagem!")
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(362, 50),
                            primary: Color(0xFFF24444)),
                        onPressed: () async {
                          await pickImage();

                          try {
                             rgImagemRef.putFile(imageTemp!);
                          } on Exception catch (e) {
                            print(e);
                          }
                        },
                        child: Text(
                          'Selecione um RG',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    cpfImagemUrl != null
                        ? Image.network(cpfImagemUrl!)
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_to_photos_outlined),
                        Text("Faça upload da imagem!")
                      ],
                    ),

                    // CachedNetworkImage(imageUrl: cpfImagemUrl.toString() ?? '',
                    //     placeholder: (context, url) => CircularProgressIndicator(),
                    //     errorWidget: (context, url , error) => Icon(Icons.hourglass_empty)),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(362, 50),
                              primary: Color(0xFFF24444)),
                          onPressed: () async {
                            await pickImage();

                            try {
                              await cpfImagemRef.putFile(imageTemp!);
                            } on Exception catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            'Selecione um CPF',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    comprovanteImagemUrl != null
                        ? Image.network(comprovanteImagemUrl!)
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_to_photos_outlined),
                        Text("Faça upload da imagem!")
                      ],
                    ),
                    // Image.network(
                    //   rgImagemUrl ?? 'nenhuma imagem carregada',
                    //   loadingBuilder: (context, child, loadingProgress) {
                    //     if (loadingProgress == null) {
                    //       return child;
                    //     } else {
                    //       return CircularProgressIndicator();
                    //     }
                    //   },
                    // ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(362, 50),
                              primary: Color(0xFFF24444)),
                          onPressed: () async {
                            await pickImage();

                            try {
                              await comprovanteImagemRef
                                  .putFile(imageTemp!);
                            } on Exception catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            'Comprovante de residencia',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    fotoImagemUrl != null
                        ? Image.network(fotoImagemUrl!)
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_to_photos_outlined),
                        Text("Faça upload da imagem!")
                      ],
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(362, 50),
                              primary: Color(0xFFF24444)),
                          onPressed: () async {
                            await pickImage();

                            try {
                              await fotoImagemRef.putFile(imageTemp!);
                            } on Exception catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            'Foto',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),

                    regulamentoImagemUrl != null
                        ? Image.network(regulamentoImagemUrl!)
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_to_photos_outlined),
                        Text("Faça upload da imagem!")
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(362, 50),
                              primary: Color(0xFFF24444)),
                          onPressed: () async {
                            await pickImage();

                            try {
                              await regulamentoImagemRef
                                  .putFile(imageTemp!);
                            } on Exception catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            'Regulamento Assinado',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
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
