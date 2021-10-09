import 'package:flutter/material.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/services/products.dart';

class AppProvider with ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _newArrivals = [];
  ProductsService _productsService = ProductsService();

  AppProvider() {
    _getAllProducts();
    _getNewArrivals();
  }

//  getter
  List<Product> get allProducts => _allProducts;
  List<Product> get newArrivals => _newArrivals;

//  methods
  void _getAllProducts() async {
    _allProducts = await _productsService.getAllProducts();
    notifyListeners();
  }

  void _getNewArrivals() async {
    _newArrivals = await _productsService.getNewArrivals();
    notifyListeners();
  }
}
