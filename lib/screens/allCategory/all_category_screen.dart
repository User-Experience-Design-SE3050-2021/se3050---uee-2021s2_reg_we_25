import 'package:flutter/material.dart';
import 'package:nolimit/components/bottom_nav_bar.dart';
import 'package:nolimit/components/topbar.dart';
import 'package:nolimit/screens/allCategory/components/body.dart';

import '../../enums.dart';

class AllCategoryScreen extends StatelessWidget {
  static String routeName = "/category";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.products),
    );
  }
}
