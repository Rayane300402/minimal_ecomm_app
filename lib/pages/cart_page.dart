import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/components/custome_drawer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(isHome: false,) ,
    );


  }
}
