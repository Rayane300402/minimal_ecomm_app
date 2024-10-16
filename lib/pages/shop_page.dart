// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/components/custome_drawer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop Page"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(isHome: true,) ,
    );
  }
}
