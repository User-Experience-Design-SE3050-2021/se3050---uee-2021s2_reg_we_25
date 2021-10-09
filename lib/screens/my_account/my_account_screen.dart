import 'package:flutter/material.dart';
import 'package:nolimit/screens/my_account/components/body.dart';

class MyAccountScreen extends StatelessWidget {
  static String routeName = '/profile/my_account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}