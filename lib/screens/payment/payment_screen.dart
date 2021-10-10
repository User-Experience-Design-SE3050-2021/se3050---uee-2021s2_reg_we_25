import 'package:flutter/material.dart';
import 'package:nolimit/screens/payment/components/body.dart';

import '../../enums.dart';

class PaymentScreen extends StatelessWidget {
  static String routeName = "/payment";

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
