import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/view/card_page.dart';
import 'package:shop_demo/view/product_details.dart';
import 'package:shop_demo/viewmodel/product_provider.dart';

import '../model/card_model.dart';
import 'home_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ProductsProvider()),
      ChangeNotifierProvider(create: (context) => Cart()),
    ],
      child: const MyApp(),
    ));
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
        '/cart': (context)=> CartScreen(),
      },
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurpleAccent,
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
