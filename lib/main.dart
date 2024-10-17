// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/models/shop.dart';
import 'package:minimal_ecomm_app/pages/cart_page.dart';
import 'package:minimal_ecomm_app/pages/intro_page.dart';
import 'package:minimal_ecomm_app/pages/shop_page.dart';
import 'package:minimal_ecomm_app/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider( //would be MultiProvider if we have like multiple providers to work with with a list of providers each is a ChangeNotifierProvider
      create: (context) =>  Shop(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: IntroPage(),
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => CartPage()
      },
    );
  }
}
