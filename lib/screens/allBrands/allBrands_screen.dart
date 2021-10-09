import 'package:flutter/material.dart';
import 'package:nolimit/components/bottom_nav_bar.dart';
import 'package:nolimit/components/topbar.dart';
import 'package:nolimit/screens/allBrands/components/body.dart';

import '../../enums.dart';

class AllBrandsScreen extends StatelessWidget {
  static String routeName = "/brands";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.products),
    );
  }
}
