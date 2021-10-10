import 'package:flutter/material.dart';
import 'package:nolimit/components/secondary_button.dart';
import 'package:nolimit/screens/home/home_screen.dart';
import 'package:nolimit/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/orderSuccess.png',
              ),
              Text(
                'Order Success',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                width: getProportionateScreenWidth(300),
                child: Text(
                  'Your order has been placed successfully and will be delivered soon. Thank you for the order.',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 25,
            left: 10,
            right: 10,
            child: SecondaryButton(
              text: 'Back to Home',
              press: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ))
      ],
    );
  }
}
