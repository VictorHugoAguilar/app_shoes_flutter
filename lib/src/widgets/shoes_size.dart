import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoes/src/helpers/helpers.dart';
import 'package:shop_shoes/src/models/shoes_model.dart';
import 'package:shop_shoes/src/pages/shoes_description.dart';

class ShoesSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoesSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cambiarStatusLight();

        if (!this.fullScreen)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ShoesDescriptionPage()));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (this.fullScreen) ? 5 : 30,
          vertical: (this.fullScreen) ? 5 : 0,
        ),
        child: Container(
            width: double.infinity,
            height: (this.fullScreen) ? 410 : 400,
            decoration: BoxDecoration(
              color: Color(0xffFFCF53),
              borderRadius: (!this.fullScreen)
                  ? BorderRadius.circular(50)
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
            ),
            child: Column(
              children: [
                _ShoesWithShadow(),
                if (!this.fullScreen) _ShoesSizes(),
              ],
            )),
      ),
    );
  }
}

class _ShoesWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ShoesModel>(context);

    return Padding(
      padding: EdgeInsets.all(40),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10,
            right: 0,
            child: _ShadowShoes(),
          ),
          Image(
            image: AssetImage(zapatoModel.assetImage),
          ),
        ],
      ),
    );
  }
}

class _ShadowShoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 250,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Color(0xffEAA14E),
                // color: Colors.black,
                blurRadius: 40,
              )
            ]),
      ),
    );
  }
}

class _ShoesSizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _SizesShoesBox(numero: 7),
          _SizesShoesBox(numero: 7.5),
          _SizesShoesBox(numero: 8),
          _SizesShoesBox(numero: 8.5),
          _SizesShoesBox(numero: 9),
          _SizesShoesBox(numero: 9.5),
        ],
      ),
    );
  }
}

class _SizesShoesBox extends StatelessWidget {
  final double numero;

  const _SizesShoesBox({this.numero});

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ShoesModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ShoesModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: (this.numero == zapatoModel.talla)
                ? Color(0xffF1A23A)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (this.numero == zapatoModel.talla)
                BoxShadow(
                  color: Color(0xffF1A23A),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
            ]),
        child: Center(
          child: Text(
            '${numero.toString().replaceAll('.0', '')}',
            style: TextStyle(
              color: (this.numero == zapatoModel.talla)
                  ? Colors.white
                  : Color(0xffF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
