import 'package:flutter/material.dart';

class BarraSuperiorLayout extends StatefulWidget {
  final Future<String?> Function() getName;
  final Future<String?> Function() getTipoConta;

  BarraSuperiorLayout( {required this.getName, required this.getTipoConta});

  @override
  _BarraSuperiorLayoutState createState() => _BarraSuperiorLayoutState();
}

class _BarraSuperiorLayoutState extends State<BarraSuperiorLayout> {
  String? name;
  String? tipoConta;

  @override
  void initState() {
    super.initState();
    _atualizarDados();
  }

  Future<void> _atualizarDados() async {
    final newName = await widget.getName();
    final newTipoConta = await widget.getTipoConta();

    setState(() {
      name = newName;
      tipoConta = newTipoConta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF181818), Color(0xFFFCC9AC)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bem vindo(a), $name',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  '$tipoConta',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
            const Image(
              width: 50,
              height: 50,
              image: NetworkImage(
                  'https://static.vecteezy.com/system/resources/thumbnails/002/318/271/small/user-profile-icon-free-vector.jpg'),
            )
          ],
        ),
      ),
    );
  }
}