import 'package:flutter/material.dart';
import 'package:shop_shoes/src/widgets/custom_widgets.dart';

class ShoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: CustomAppBar(texto: 'For you'),
      // body: ShoesSizePreview(),
      body: Column(
        children: <Widget>[
          CustomAppBar(texto: 'For you'),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                    tag: 'Shoes_1',
                    child: ShoesSizePreview(),
                  ),
                  ShoesDescription(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          AgregarCarritoBoton(valor: 180.0),
        ],
      ),
    );
  }
}
