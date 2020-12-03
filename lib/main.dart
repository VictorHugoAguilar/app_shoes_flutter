import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_shoes/src/models/shoes_model.dart';
import 'package:shop_shoes/src/pages/shoes_page.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ShoesModel>(create: (_) => new ShoesModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      home: ShoesPage(),
      //home: ShoesDescriptionPage(),
    );
  }
}
