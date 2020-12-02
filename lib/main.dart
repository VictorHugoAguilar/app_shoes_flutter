import 'package:flutter/material.dart';
import 'package:shop_shoes/src/pages/shoes_description.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      // home: ShoesPage(),
      home: ShoesDescriptionPage(),
    );
  }
}
