import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/models/product.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  void addToCart(BuildContext context){
    // confirmation dialog box
    showDialog(
        context: context,
        builder: (context) => AlertDialog(

          content: Text('Add this item to your cart?'),
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

                context.read<Shop>().addToCart(product);
              },
              child: Text('Confirm'),
            )

          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary
                  ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    child: const Icon(Icons.favorite)
                ),
              ),

              const SizedBox(height:25),

              //product name
              Text(
                  product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),

              const SizedBox(height:25),

              //product description
              Text(
                  product.description,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  )
              ),
            ],
          ),

          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // product price
              Text('\$${product.price.toStringAsFixed(2)}'),

              // add cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: const Icon(Icons.add)
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
