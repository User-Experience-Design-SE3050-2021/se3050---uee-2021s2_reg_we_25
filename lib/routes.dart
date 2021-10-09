import 'package:flutter/widgets.dart';
import 'package:nolimit/screens/allProducts/all_products_screen.dart';
import 'package:nolimit/screens/home/home_screen.dart';
import 'package:nolimit/screens/my_account/my_account_screen.dart';
import 'package:nolimit/screens/profile/profile_screen.dart';
import 'package:nolimit/screens/sign_in/sign_in_screen.dart';
import 'package:nolimit/screens/singleProduct/singleProduct_screen.dart';
import 'package:nolimit/screens/sign_up/sign_up_screen.dart';
import 'package:nolimit/screens/sign_up_success/sign_up_success_screen.dart';
import 'package:nolimit/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  AllProductsScreen.routeName: (context) => AllProductsScreen(),
  SingleProductScreen.routeName: (context) => SingleProductScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignUpSuccessScreen.routeName: (context) => SignUpSuccessScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  MyAccountScreen.routeName: (context) => MyAccountScreen(),
};
