import 'package:flutter/material.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/services/products.dart';

class AppProvider with ChangeNotifier {
  List<Product> _allProducts = [];
  ProductsService _productsService = ProductsService();

  AppProvider() {
    _getAllProducts();
  }

//  getter
  List<Product> get allProducts => _allProducts;

//  methods
  void _getAllProducts() async {
    _allProducts = await _productsService.getAllProducts();
    notifyListeners();
  }
}
