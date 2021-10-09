import 'package:flutter/material.dart';
import 'package:nolimit/models/Offer.dart';
import 'package:nolimit/models/Product.dart';
import 'package:nolimit/services/products.dart';
import 'package:nolimit/services/offers.dart';

class AppProvider with ChangeNotifier {
  List<Product> _allProducts = [];
  List<Offer> _allOffers = [];
  ProductsService _productsService = ProductsService();
  OffersService _offersService = OffersService();

  AppProvider() {
    _getAllProducts();
    _getAllOffers();
  }

//  getter
  List<Product> get allProducts => _allProducts;
  List<Offer> get allOffers => _allOffers;

//  methods
  void _getAllProducts() async {
    _allProducts = await _productsService.getAllProducts();
    notifyListeners();
  }

  void _getAllOffers() async {
    _allOffers = await _offersService.getAllOffers();
    notifyListeners();
  }
}
