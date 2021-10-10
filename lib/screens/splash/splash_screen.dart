import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';
import 'package:nolimit/screens/home/home_screen.dart';
import 'package:nolimit/screens/sign_in/sign_in_screen.dart';
import 'package:nolimit/screens/sign_up/sign_up_screen.dart';
import 'dart:async';
import '../../size_config.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  final db = Localstore.instance;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(Duration(seconds: 3), () async {
      final data = await db.collection('login').doc('loginData').get();
      var replacement;
      inspect(data);

      if (data != null && data["id"] != null) {
        replacement = HomeScreen();
      } else {
        replacement = SignInScreen();
      }

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => replacement));
    });
    return Scaffold(
      body: Body(),
    );
  }
}
