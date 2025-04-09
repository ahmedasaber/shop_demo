import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/view/product_details.dart';
import 'package:shop_demo/viewmodel/product_provider.dart';

import 'home_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => ProductsProvider(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context)=> Home(),
        '/productDetails': (context)=> ProductDetails(),
      },
      theme: ThemeData(
        colorSchemeSeed: Colors.pinkAccent
      ),
      home: Home(),
    );
  }
}
