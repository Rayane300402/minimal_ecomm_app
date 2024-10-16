// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //title
            Text(
              'Minimal Shop',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            const SizedBox(height: 10),

            //subtitle
            Text(
              'Premium Quality Products',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            //button to enter shop
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: Icon(Icons.arrow_forward_sharp)
            )
          ],
        ),
      ),
    );
  }
}
