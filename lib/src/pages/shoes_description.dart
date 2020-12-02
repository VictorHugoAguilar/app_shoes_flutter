import 'package:flutter/material.dart';
import 'package:shop_shoes/src/widgets/custom_widgets.dart';

class ShoesDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ShoesSizePreview(fullScreen: true),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ShoesDescription(
                titulo: 'Nike Air Max 720',
                descripcion:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              _PriceNow(
                price: 180,
              ),
              _Colores()
            ],
          ),
        )),
      ],
    ));
  }
}

class _Colores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _BotonColor(color: Color(0xff364D56)),
                ),
                Positioned(
                  left: 60,
                  child: _BotonColor(color: Color(0xff2099F1)),
                ),
                Positioned(
                  left: 30,
                  child: _BotonColor(color: Color(0xffFFAD29)),
                ),
                _BotonColor(color: Color(0xffC6D642)),
              ],
            ),
          ),
          BotonNaranja(
            texto: 'More relate items',
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final double alto;
  final double ancho;

  const _BotonColor({@required this.color, this.alto = 45, this.ancho = 45});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.ancho,
      height: this.alto,
      decoration: BoxDecoration(
        color: this.color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _PriceNow extends StatelessWidget {
  final double price;

  const _PriceNow({@required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Text(
            '\$ $price',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          BotonNaranja(
            texto: 'Buy Now',
            ancho: 120,
            alto: 40,
          )
        ],
      ),
    );
  }
}
