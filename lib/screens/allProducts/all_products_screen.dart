import 'package:flutter/material.dart';
import 'package:nolimit/components/bottom_nav_bar.dart';
import 'package:nolimit/components/topbar.dart';
import 'package:nolimit/screens/allProducts/components/body.dart';

import '../../enums.dart';

class AllProductsScreen extends StatelessWidget {
  static String routeName = "/products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.products),
    );
  }
}
