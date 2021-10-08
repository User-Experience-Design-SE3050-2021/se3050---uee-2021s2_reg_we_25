import 'package:flutter/material.dart';
import 'package:nolimit/screens/delivery/components/body.dart';

import '../../enums.dart';

class DeliveryScreen extends StatelessWidget {
  static String routeName = "/delivery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Checkout",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
