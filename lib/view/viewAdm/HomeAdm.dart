import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAdm/NavigationBarAdm.dart';
import 'package:natacaoapp/controller/UsuarioController.dart';

import '../shared/layouts/BarraSuperiorLayout.dart';

UsuarioController usuarioController = new UsuarioController();

class HomeAdm extends StatelessWidget {
  const HomeAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Navigation());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});


  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int paginaAtual = 0;

  Future<String?> _obterNomeUsuario() async {
    String? nomeUsuario =  await usuarioController.obterNomeUsuario();

    return nomeUsuario ?? "";
  }

  Future<String?> _obterTipoConta() async {
    String? tipoConta =  await usuarioController.obterTipoConta() ;

    return tipoConta  ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: BarraSuperiorLayout(getName: _obterNomeUsuario, getTipoConta: _obterTipoConta),
        toolbarHeight: MediaQuery.of(context).size.height*0.18,
      ),
      body: FutureBuilder<String?>(
          future: _obterTipoConta(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Enquanto o Future ainda estiver em execução, mostre um indicador de carregamento
              return CircularProgressIndicator();
            }
            else {
              // Se o Future for concluído com êxito, verifique o resultado
              String? tipoConta = snapshot.data;

              // if(tipoConta =='Administrador'){
              //   NavigationBarAdm();
              // }

              return NavigationBarAdm();
            }


          },

          // NavigationBarAdm()
      ),

    );
  }
}
