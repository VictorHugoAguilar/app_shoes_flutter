import 'package:flutter/services.dart' as service;

void cambiarStatusLight() {
  service.SystemChrome.setSystemUIOverlayStyle(
      service.SystemUiOverlayStyle.light);
}

void cambiarStatusDark() {
  service.SystemChrome.setSystemUIOverlayStyle(
      service.SystemUiOverlayStyle.dark);
}
