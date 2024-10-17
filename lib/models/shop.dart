import 'package:flutter/material.dart';
import 'package:minimal_ecomm_app/models/product.dart';

class Shop extends ChangeNotifier{

  // list of products for sale
  final List<Product> _shop = [
    Product(name: 'Product 1', price: 127.99, description: 'It is The first product', ImagePath: 'assets/images/Puffer.png'),
    Product(name: 'Product 2', price: 181.99, description: 'It is The second product', ImagePath: 'assets/images/Sweatpant.png'),
    Product(name: 'Product 3', price: 340.50, description: 'It is The third product', ImagePath: 'assets/images/Supreme.png'),
    Product(name: 'Product 4', price: 328.25, description: 'It is The fourth product', ImagePath: 'assets/images/Swatch.png'),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add items to cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  // remove items from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}