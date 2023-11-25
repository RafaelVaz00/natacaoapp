// import 'package:flutter/material.dart';
// import 'package:natacaoapp/view/viewAdm/MenuInicioAdm.dart';
// import 'package:natacaoapp/view/viewAdm/MenuPerfilAdm.dart';
// import 'package:natacaoapp/view/viewAtleta/HomeAtleta.dart';
// import 'package:natacaoapp/view/viewAtleta/PerfilAtleta.dart';
// import 'package:natacaoapp/view/viewTreinador/HomeTreinador.dart';
// import 'package:natacaoapp/view/viewTreinador/VisualizarContasTreinador.dart';
//
// class NavigationBarAdm extends StatefulWidget {
//
//   final String tipoContaRaiz;
//
//   const NavigationBarAdm({required this.tipoContaRaiz});
//
//   @override
//   State<NavigationBarAdm> createState() => _NavigationBarAdmState();
// }
//
// class _NavigationBarAdmState extends State<NavigationBarAdm> {
//
//   int paginaAtual = 0;
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     bottomNavigationBar: NavigationBar(
//   //       labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//   //       onDestinationSelected: (int index) {
//   //         setState(() {
//   //           paginaAtual = index;
//   //         });
//   //       },
//   //       indicatorColor: Colors.white,
//   //       selectedIndex: paginaAtual,
//   //       destinations: const <Widget>[
//   //         NavigationDestination(
//   //           selectedIcon: Icon(Icons.home),
//   //           icon: Icon(Icons.home_outlined),
//   //           label: 'Início',
//   //         ),
//   //         NavigationDestination(
//   //           selectedIcon: Icon(Icons.person),
//   //           icon: Icon(Icons.person_2_outlined),
//   //           label: 'Perfil',
//   //         )
//   //       ],
//   //     ),
//   //     body: <Widget>[
//   //         MenuInicioAdm(), //paginaAtual= 0
//   //         MenuPerfilAdm(), //paginaAtual = 1
//   //     ][paginaAtual],
//   //   );
//   // }
//   List<Widget> getWidgetsByTipoConta(String? tipoConta) {
//
//
//     switch (tipoConta) {
//       case 'ADMINISTRADOR':
//         return [MenuInicioAdm(), MenuPerfilAdm() ];
//       case 'ATLETA':
//         return [HomeAtleta(), MenuPerfilAtleta()
//         // ,AtletaCronometro()
//     ];
//     // Adicione mais casos conforme necessário para outros tipos de conta
//       default:
//         return [HomeTreinador(), VisualizarContasTreinador()];
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> bodyWidgets = getWidgetsByTipoConta(widget.tipoContaRaiz);
//
//
//     // Adicione os destinos de navegação com base no valor de tipoContaRaiz
//     // if (widget.tipoContaRaiz == 'ADMINISTRADOR') {
//     //   destinations.add(NavigationDestination(
//     //     selectedIcon: Icon(Icons.home),
//     //     icon: Icon(Icons.home_outlined),
//     //     label: 'Início',
//     //   ));
//     //   destinations.add(NavigationDestination(
//     //     selectedIcon: Icon(Icons.person),
//     //     icon: Icon(Icons.person_2_outlined),
//     //     label: 'Perfil',
//     //   ));
//     // } else if(widget.tipoContaRaiz=='ATLETA') {
//     //   destinations.add( NavigationDestination(
//     //     selectedIcon: Icon(Icons.home),
//     //     icon: Icon(Icons.home_outlined),
//     //     label: 'Início',
//     //   ));
//     //   // Adicione mais destinos conforme necessário
//     //   destinations.add( NavigationDestination(
//     //     selectedIcon: Icon(Icons.auto_graph),
//     //     icon: Icon(Icons.auto_graph_outlined),
//     //     label: 'Desempenho',
//     //   ));
//     //   // Adicione mais destinos conforme necessário
//     //   destinations.add(NavigationDestination(
//     //     selectedIcon: Icon(Icons.person),
//     //     icon: Icon(Icons.person_2_outlined),
//     //     label: 'Perfil',
//     //   ));
//     //   // Adicione mais destinos conforme necessário
//     // }else {
//     //   destinations.add(NavigationDestination(
//     //     selectedIcon: Icon(Icons.home),
//     //     icon: Icon(Icons.home_outlined),
//     //     label: 'Início',
//     //   ));
//     //   destinations.add(NavigationDestination(
//     //     selectedIcon: Icon(Icons.person),
//     //     icon: Icon(Icons.person_2_outlined),
//     //     label: 'Perfil',
//     //   ));
//     // }
//
//     return Scaffold(
//         bottomNavigationBar: NavigationBar(
//           labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//           onDestinationSelected: (int index) {
//             setState(() {
//               paginaAtual = index;
//             });
//           },
//           indicatorColor: Colors.white,
//           selectedIndex: paginaAtual,
//           destinations: const <Widget>[
//             NavigationDestination(
//               selectedIcon: Icon(Icons.home),
//               icon: Icon(Icons.home_outlined),
//               label: 'Início',
//             ),
//             NavigationDestination(
//               selectedIcon: Icon(Icons.person),
//               icon: Icon(Icons.person_2_outlined),
//               label: 'Perfil',
//             )
//           ],
//         ),
//       body: IndexedStack(
//         index: paginaAtual,
//       children: bodyWidgets,
//     ));
//   }
// }
//
