// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/pages/cart_page.dart';
import 'package:minimal_ecomm_app/pages/intro_page.dart';
import 'package:minimal_ecomm_app/pages/shop_page.dart';
import 'package:minimal_ecomm_app/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
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
