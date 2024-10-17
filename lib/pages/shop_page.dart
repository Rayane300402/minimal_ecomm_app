// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/components/custome_drawer.dart';
import 'package:minimal_ecomm_app/components/product_tile.dart';
import 'package:minimal_ecomm_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Shop Page"),
          actions: [
            // cart button to quickly access
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: Icon(Icons.shopping_cart))
          ],
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        drawer: MyDrawer(
          isHome: true,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),

            //shop subtitle
            Center(
                child: Text(
              'Pick from a selected list of premium products ',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),

            //product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  //get each individual product from the shop
                  final product = products[index];

                  // return product as tile UI
                  return ProductTile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
