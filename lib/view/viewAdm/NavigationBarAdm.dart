import 'package:flutter/material.dart';
import 'package:natacaoapp/view/viewAdm/CriarContaAdm.dart';
import 'package:natacaoapp/view/viewAdm/MenuInicioAdm.dart';
import 'package:natacaoapp/view/viewAdm/MenuPerfilAdm.dart';
import 'package:natacaoapp/view/viewAdm/VisualizarContasAdm.dart';
import '../shared/layouts/BarraSuperiorLayout.dart';

class NavigationBarAdm extends StatefulWidget {
  const NavigationBarAdm({super.key});

  @override
  State<NavigationBarAdm> createState() => _NavigationBarAdmState();
}

class _NavigationBarAdmState extends State<NavigationBarAdm> {

  int paginaAtual = 0;

  String tipoConta = '';

  @override
  Widget build(BuildContext context) {
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
      body: <Widget>[
          MenuInicioAdm(), //paginaAtual= 0
          MenuPerfilAdm(), //paginaAtual = 1
      ][paginaAtual],
    );
  }
}
