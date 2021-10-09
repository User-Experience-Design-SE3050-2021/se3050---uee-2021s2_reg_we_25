import 'package:flutter/material.dart';
import 'package:nolimit/components/bottom_nav_bar.dart';
import 'package:nolimit/components/topbar.dart';
import 'package:nolimit/screens/allOffers/components/body.dart';

import '../../enums.dart';

class AllOffersScreen extends StatelessWidget {
  static String routeName = "/offers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.products),
    );
  }
}
