import 'package:flutter/material.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/services/products.dart';

class AppProvider with ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> _newArrivals = [];
  List<Product> _trendingProducts = [];
  List<Product> _bestSellers = [];

  ProductsService _productsService = ProductsService();

  AppProvider() {
    _getAllProducts();
    _getNewArrivals();
    _getTrendingProducts();
    _getBestSellers();
  }

//  getter
  List<Product> get allProducts => _allProducts;
  List<Product> get newArrivals => _newArrivals;
  List<Product> get bestSellers => _bestSellers;
  List<Product> get trendingProducts => _trendingProducts;

//  methods
  void _getAllProducts() async {
    _allProducts = await _productsService.getAllProducts();
    notifyListeners();
  }

  void _getNewArrivals() async {
    _newArrivals = await _productsService.getNewArrivals();
    notifyListeners();
  }

  void _getTrendingProducts() async {
    _trendingProducts = await _productsService.getTrendingProducts();
    notifyListeners();
  }

  void _getBestSellers() async {
    _bestSellers = await _productsService.getBestSellers();
    notifyListeners();
  }

  List<Product> filterProducts(String category) {
    List<Product> products = [];
    if (category == "All") {
      return allProducts;
    }
    allProducts.forEach((product) {
      print(product);
      if (product.categories.contains(category)) {
        products.add(product);
      }
    });
    return products;
  }
}
