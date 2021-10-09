import 'package:flutter/widgets.dart';
import 'package:nolimit/screens/allBrands/allBrands_screen.dart';
import 'package:nolimit/screens/allCategory/all_category_screen.dart';
import 'package:nolimit/screens/allOffers/all_offers_screen.dart';
import 'package:nolimit/screens/allProducts/all_products_screen.dart';
import 'package:nolimit/screens/cart/cart_screen.dart';
import 'package:nolimit/screens/checkout/checkout_screen.dart';
import 'package:nolimit/screens/complete_profile/complete_profile_screen.dart';
import 'package:nolimit/screens/delivery/delivery_screen.dart';
import 'package:nolimit/screens/home/home_screen.dart';
import 'package:nolimit/screens/orderSummary/orderSummary_screen.dart';
import 'package:nolimit/screens/order_success/order_success_screen.dart';
import 'package:nolimit/screens/payment/payment_screen.dart';
import 'package:nolimit/screens/singleOffer/singleOffer_screen.dart';
import 'package:nolimit/screens/singleProduct/singleProduct_screen.dart';
import 'package:nolimit/screens/sign_up/sign_up_screen.dart';
import 'package:nolimit/screens/sign_up_success/sign_up_success_screen.dart';
import 'package:nolimit/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  AllProductsScreen.routeName: (context) => AllProductsScreen(),
  AllCategoryScreen.routeName: (context) => AllCategoryScreen(),
  SingleProductScreen.routeName: (context) => SingleProductScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  SignUpSuccessScreen.routeName: (context) => SignUpSuccessScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  CheckoutScreen.routeName: (context) => CheckoutScreen(),
  DeliveryScreen.routeName: (context) => DeliveryScreen(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
  OrderSummaryScreen.routeName: (context) => OrderSummaryScreen(),
  OrderSuccessScreen.routeName: (context) => OrderSuccessScreen(),
  AllBrandsScreen.routeName: (context) => AllBrandsScreen(),
  AllOffersScreen.routeName: (context) => AllOffersScreen(),
  SingleOfferScreen.routeName: (context) => SingleOfferScreen(),
};
