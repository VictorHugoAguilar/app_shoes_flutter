import 'package:flutter/material.dart';

class ShoesModel with ChangeNotifier {
  String _assetImage = 'assets/img/azul.png';
  double _talla = 9.0;

  String get assetImage => this._assetImage;
  set assetImage(String valor) {
    this._assetImage = valor;
    notifyListeners();
  }

  double get talla => this._talla;
  set talla(double talla) {
    this._talla = talla;
    notifyListeners();
  }
}
