import 'package:flutter/material.dart';
import 'package:nolimit/components/bottom_nav_bar.dart';
import 'package:nolimit/enums.dart';
import 'package:nolimit/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}