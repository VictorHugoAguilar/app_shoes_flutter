import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  final Color color;
  final String texto;
  final double alto;
  final double ancho;

  const BotonNaranja(
      {@required this.texto,
      this.alto = 50,
      this.ancho = 150,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.ancho,
      height: this.alto,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        texto,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
