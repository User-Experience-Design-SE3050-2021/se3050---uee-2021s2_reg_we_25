import 'package:flutter/widgets.dart';
import 'package:nolimit/screens/allBrands/allBrands_screen.dart';
import 'package:nolimit/screens/allCategory/all_category_screen.dart';
import 'package:nolimit/screens/allProducts/all_products_screen.dart';
import 'package:nolimit/screens/home/home_screen.dart';
import 'package:nolimit/screens/singleProduct/singleProduct_screen.dart';
import 'package:nolimit/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  AllProductsScreen.routeName: (context) => AllProductsScreen(),
  AllCategoryScreen.routeName: (context) => AllCategoryScreen(),
  SingleProductScreen.routeName: (context) => SingleProductScreen(),
  AllBrandsScreen.routeName: (context) => AllBrandsScreen(),
};
