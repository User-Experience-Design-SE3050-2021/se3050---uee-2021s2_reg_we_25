import 'package:flutter/material.dart';
import 'package:nolimit/screens/profile/components/profile_pic.dart';
import 'profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(height: 20,),
        ProfileMenu(
          icon: 'assets/icons/User Icon.svg',
          text: 'My Account',
          press: () {}
        ),
        ProfileMenu(
          icon: 'assets/icons/Bell.svg',
          text: 'Notifications',
          press: () {}
        ),
        ProfileMenu(
          icon: 'assets/icons/Settings.svg',
          text: 'Settings',
          press: () {}
        ),
        ProfileMenu(
          icon: 'assets/icons/Log out.svg',
          text: 'Log Out',
          press: () {}
        ),
      ],
    );
  }
}
