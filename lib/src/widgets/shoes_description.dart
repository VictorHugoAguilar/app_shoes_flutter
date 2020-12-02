import 'package:flutter/material.dart';

class ShoesDescription extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ShoesDescription({this.titulo, this.descripcion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      // color: Colors.orange,
      width: double.infinity,
      height: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            this.titulo,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(
            this.descripcion,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                height: 1.6),
          ),
        ],
      ),
    );
  }
}
