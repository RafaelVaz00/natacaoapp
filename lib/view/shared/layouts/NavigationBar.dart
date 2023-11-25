import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAdm/MenuInicioAdm.dart';
import 'package:natacaoapp/view/viewAdm/MenuPerfilAdm.dart';
import 'package:natacaoapp/view/viewAtleta/HomeAtleta.dart';
import 'package:natacaoapp/view/viewAtleta/PerfilAtleta.dart';
import 'package:natacaoapp/view/viewTreinador/HomeTreinador.dart';
import 'package:natacaoapp/view/viewTreinador/PerfilTreinador.dart';


class BarraDeNavegacao extends StatefulWidget {

  final String tipoContaRaiz;

  const BarraDeNavegacao({required this.tipoContaRaiz});

  @override
  State<BarraDeNavegacao> createState() => _BarraDeNavegacaoState();
}

class _BarraDeNavegacaoState extends State<BarraDeNavegacao> {

  int paginaAtual = 0;

  List<Widget> getWidgetsByTipoConta(String? tipoConta) {


    switch (tipoConta) {
      case 'ADMINISTRADOR':
        return [MenuInicioAdm(), MenuPerfilAdm() ];
      case 'ATLETA':
        return [HomeAtleta(), PerfilAtleta()
          // ,AtletaCronometro()
        ];
    // Adicione mais casos conforme necessário para outros tipos de conta
      default:
        return [HomeTreinador(), PerfilTreinador()];
    }
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = getWidgetsByTipoConta(widget.tipoContaRaiz);

    return Scaffold(
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (int index) {
            setState(() {
              paginaAtual = index;
            });
          },
          indicatorColor: Colors.white,
          selectedIndex: paginaAtual,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Início',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_2_outlined),
              label: 'Perfil',
            )
          ],
        ),
        body: IndexedStack(
          index: paginaAtual,
          children: bodyWidgets,
        ));
  }
}

