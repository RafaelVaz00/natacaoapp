import 'package:flutter/material.dart';
import 'package:natacaoapp/view/shared/layouts/BarraSuperiorLayout.dart';
import 'package:natacaoapp/view/shared/layouts/BarraDeNavegacao.dart';
import 'package:natacaoapp/controller/UsuarioController.dart';

UsuarioController usuarioController = new UsuarioController();

class Home extends StatelessWidget {
  const Home({super.key});

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
    String? uid = await usuarioController.obterUserID();

    if (uid != null) {
      String? nomeUsuario = await usuarioController.obterNomeUsuario();
      return nomeUsuario;
    }
    return null;
  }

  Future<String?> _obterTipoConta() async {

    String? uid = await usuarioController.obterUserID();

    if (uid != null) {
      String? tipoConta = await usuarioController.obterTipoConta();
      return tipoConta;
    }
    return null;

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

            if(tipoConta != null){
              return BarraDeNavegacao(tipoContaRaiz: tipoConta);
            }else {
              if (snapshot.connectionState == ConnectionState.waiting) {
              // Enquanto o Future ainda estiver em execução, mostre um indicador de carregamento
              return CircularProgressIndicator();
            }
              return Text('HOUVE UM ERRO, ENTRE EM CONTATO COM RVSANTOS@UNAERP.BR');
            }
          }


        },

        // NavigationBarAdm()
      ),

    );
  }
}
