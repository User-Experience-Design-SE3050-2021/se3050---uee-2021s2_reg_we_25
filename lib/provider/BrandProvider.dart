import 'package:flutter/material.dart';
import 'package:nolimit/models/Brand.dart';
import 'package:nolimit/services/Brand.dart';



class BrandProvider with ChangeNotifier {
  List<Brand> _allBrand = [];
  BrandService _BrandService = BrandService();

  BrandProvider() {
    _getAllBrand();
  }

//  getter
  List<Brand> get allBrand => _allBrand;

//  methods
  void _getAllBrand() async {
    _allBrand = await _BrandService.getAllBrand();
    notifyListeners();
  }
}
