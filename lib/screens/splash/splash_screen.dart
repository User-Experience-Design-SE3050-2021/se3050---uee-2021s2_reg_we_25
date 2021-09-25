import 'package:flutter/material.dart';
import 'package:nolimit/screens/allProducts/all_products_screen.dart';
import 'package:nolimit/screens/home/home_screen.dart';
import 'dart:async';
import '../../size_config.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(Duration(seconds: 3), () {
      // 5 seconds over, navigate to Page2.
      Navigator.pushNamed(context, AllProductsScreen.routeName);
    });
    return Scaffold(
      body: Body(),
    );
  }
}
