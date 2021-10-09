import 'package:flutter/material.dart';
import 'package:nolimit/models/Category.dart';
import 'package:nolimit/services/Category.dart';


class CategoryProvider with ChangeNotifier {
  List<Category> _allCategory = [];
  CategoryService _categoryService = CategoryService();

  CategoryProvider() {
    _getAllCategory();
  }

//  getter
  List<Category> get allCategory => _allCategory;

//  methods
  void _getAllCategory() async {
    _allCategory = await _categoryService.getAllCategory();
    notifyListeners();
  }
}
