import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:nolimit/models/Product.dart';

class Cart {
  final Product product;
  int numOfItems;

  Cart({required this.product, required this.numOfItems});

  static List<Cart> cartItems = [];

  static void addToCart({product: Product, qty: int}) {
    cartItems.add(new Cart(product: product, numOfItems: qty));
  }
}
