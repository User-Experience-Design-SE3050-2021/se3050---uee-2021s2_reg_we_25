import 'package:flutter/material.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/provider/app_provider.dart';
import 'package:nolimit/routes.dart';
import 'package:nolimit/screens/sign_up/sign_up_screen.dart';
import 'package:nolimit/screens/splash/splash_screen.dart';
import 'package:nolimit/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AppProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nolimit',
      theme: theme(),
      initialRoute: SignUpScreen.routeName,
      routes: routes,
    );
  }
}
