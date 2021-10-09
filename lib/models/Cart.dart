import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:nolimit/models/Order.dart';
import 'package:nolimit/models/Product.dart';

class Cart {
  final Product product;
  int numOfItems;
  String selectedSize;
  String selectedColor;
  int colorCode;

  Cart(
      {required this.product,
      required this.numOfItems,
      required this.selectedSize,
      required this.selectedColor,
      required this.colorCode});

  static List<Cart> cartItems = [];

  static void addToCart(
      {product: Product,
      qty: int,
      size: String,
      color: String,
      colorCode: int}) {
    int index = 0;
    bool alreadyExist = false;
    cartItems.forEach((item) {
      if (item.product.id == product.id &&
          item.selectedSize == size &&
          item.selectedColor == color) {
        cartItems[index].numOfItems =
            (cartItems[index].numOfItems + qty) as int;
        alreadyExist = true;
      }
      index++;
    });
    if (!alreadyExist) {
      cartItems.add(new Cart(
          product: product,
          numOfItems: qty,
          selectedSize: size,
          selectedColor: color,
          colorCode: colorCode));
    }
  }

  static void removeOrderedItemsFromCart() {
    Order order = Order.getOrder();

    order.products.forEach((product) {
      int index = 0;
      int productIndex = 0;
      cartItems.forEach((item) {
        print("Item id ${item.product.id}");
        print("Product Id ${product.productId}");
        print(item.product.id == product.productId);
        if (item.product.id == product.productId) {
          print(cartItems);
          print("In Cart");
          print(index);
          productIndex = index;
        }
        index++;
      });
      cartItems.removeAt(productIndex);
    });
  }
}
