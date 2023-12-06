import 'package:flutter/material.dart';

class NetworkImageWidget extends StatefulWidget {
  final String imageUrl;

  const NetworkImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _NetworkImageWidgetState createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.network(widget.imageUrl,
      fit: BoxFit.cover, // Ajuste conforme necessário
      width: 100, // Ajuste conforme necessário
      height: 100,);
  }
}

