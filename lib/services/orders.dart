import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nolimit/models/Order.dart';

class OrderService {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  Future<void> addOrder() {
    Order order = Order.getOrder();

    List<Map<String, dynamic>> orderProducts = [];

    order.products.forEach((product) {
      var temp = {
        "productId": product.productId,
        "size": product.size,
        "color": product.color,
        "productName": product.productName,
        "qty": product.qty,
        "price": product.price,
      };
      orderProducts.add(temp);
    });

    return orders
        .add({
          "fname": order.fname,
          "lname": order.lname,
          "mobile": order.mobile,
          "city": order.city,
          "district": order.district,
          "address": order.address,
          "total": order.total,
          "deliveryType": order.deliveryType,
          "deliveryCharge": order.deliveryCharge,
          "paymentType": order.paymentType,
          "products": orderProducts
        })
        .then((value) => print(value))
        .catchError((error) => print("Failed to add order: $error"));
  }
}
