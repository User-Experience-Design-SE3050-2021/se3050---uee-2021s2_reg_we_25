import 'package:flutter/material.dart';
import 'package:nolimit/components/bottom_nav_bar.dart';
import 'package:nolimit/components/topbar.dart';
import 'package:nolimit/screens/categoryProducts/components/body.dart';

import '../../enums.dart';

class CategoryProductsScreen extends StatelessWidget {
  static String routeName = "/products/category";

  @override
  Widget build(BuildContext context) {
    final String arguments =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: Topbar(),
      body: Body(
        category: arguments,
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.products),
    );
  }
}
