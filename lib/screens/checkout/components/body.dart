import 'package:flutter/material.dart';
import 'package:nolimit/components/CheckoutProgress.dart';
import 'package:nolimit/screens/cart/components/checkout_form.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Theme(
          data: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
            errorStyle: TextStyle(fontSize: 9, height: 0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: kGreyBorder),
              gapPadding: 5,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: kGreyBorder),
              gapPadding: 5,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          )),
          child: Column(
            children: [
              CheckoutProgress(index: 1),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ShippingForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
