import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoes/src/helpers/helpers.dart';
import 'package:shop_shoes/src/models/shoes_model.dart';
import 'package:shop_shoes/src/widgets/custom_widgets.dart';

class ShoesDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(
              tag: 'Shoes_1',
              child: ShoesSizePreview(fullScreen: true),
            ),
            Positioned(
                top: 80,
                left: 10,
                child: FloatingActionButton(
                  onPressed: () {
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                ))
          ],
        ),
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
              _Colores(),
              _BotonesLikeCarSettings(),
            ],
          ),
        )),
      ],
    ));
  }
}

class _BotonesLikeCarSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BotonSombreado(
              icono: Icon(
            Icons.star,
            color: Colors.redAccent,
          )),
          _BotonSombreado(
              icono: Icon(
            Icons.add_shopping_cart,
            color: Colors.grey.withOpacity(0.7),
          )),
          _BotonSombreado(
              icono: Icon(
            Icons.settings,
            color: Colors.grey.withOpacity(0.5),
          )),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icono;
  final Color color;
  final double ancho;
  final double alto;

  const _BotonSombreado(
      {@required this.icono,
      this.color = Colors.white,
      this.ancho = 50,
      this.alto = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.ancho,
      height: this.alto,
      decoration: BoxDecoration(
        color: this.color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10))
        ],
      ),
      child: this.icono,
    );
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
                  child: _BotonColor(
                    color: Color(0xff364D56),
                    index: 4,
                    rutaAssets: 'assets/img/verde.png',
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _BotonColor(
                    color: Color(0xff2099F1),
                    index: 3,
                    rutaAssets: 'assets/img/azul.png',
                  ),
                ),
                Positioned(
                  left: 30,
                  child: _BotonColor(
                    color: Color(0xffFFAD29),
                    index: 2,
                    rutaAssets: 'assets/img/amarillo.png',
                  ),
                ),
                _BotonColor(
                    color: Color(0xffC6D642),
                    index: 1,
                    rutaAssets: 'assets/img/verde.png'),
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
  final int index;
  final String rutaAssets;

  const _BotonColor({
    @required this.color,
    @required this.index,
    @required this.rutaAssets,
    this.alto = 45,
    this.ancho = 45,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ShoesModel>(context, listen: false);
          zapatoModel.assetImage = this.rutaAssets;
        },
        child: Container(
          width: this.ancho,
          height: this.alto,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
          ),
        ),
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
          Bounce(
            delay: Duration(milliseconds: 1000),
            from: 8,
            child: BotonNaranja(
              texto: 'Buy Now',
              ancho: 120,
              alto: 40,
            ),
          )
        ],
      ),
    );
  }
}
