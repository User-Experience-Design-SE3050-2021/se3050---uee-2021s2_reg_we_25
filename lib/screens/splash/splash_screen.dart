import 'package:flutter/material.dart';
import 'package:nolimit/screens/sign_up/sign_up_screen.dart';
import 'dart:async';
import '../../size_config.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpScreen()
        )
      );
    });
    return Scaffold(
      body: Body(),
    );
  }
}
