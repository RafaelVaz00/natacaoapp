import 'package:firebase_storage/firebase_storage.dart';

class GeradorURL {
  String? downloadURL;

  Future getData(String refe, String arq) async {
    try{
      await downloadURLArquivos(refe, arq);
      return downloadURL;
    } catch(e){
      return null;
    }
  }

  Future<void> downloadURLArquivos(String referencia, String arquivo) async{
    downloadURL = await FirebaseStorage.instance.ref(referencia)
        .child(arquivo)
        .getDownloadURL();
  }
}