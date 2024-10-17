// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/components/button.dart';
import 'package:minimal_ecomm_app/components/custome_drawer.dart';
import 'package:minimal_ecomm_app/models/product.dart';
import 'package:minimal_ecomm_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    // confirmation dialog box
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Remove this item to your cart?'),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),

          //confirm button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<Shop>().removeFromCart(product);
            },
            child: Text('Confirm'),
          )
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content:
            Text('User wants to pay! Connect this app to your payment backend'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to card
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      // drawer: const MyDrawer(
      //   isHome: false,
      // ),
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text(
                    'Your cart is currently empty! Go and shop to fill it up!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get individual list
                      final item = cart[index];

                      // return as list tile
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),

          //pay button
          if (cart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(
                  onTap: () => payButtonPressed(context),
                  child: Text('PAY NOW')),
            )
        ],
      ),
    );
  }
}
