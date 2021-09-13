import 'package:flutter/material.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/routes.dart';
import 'package:nolimit/screens/splash/splash_screen.dart';
import 'package:nolimit/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nolimit',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
