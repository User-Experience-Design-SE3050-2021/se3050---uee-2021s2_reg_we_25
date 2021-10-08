import 'package:flutter/material.dart';
import 'package:nolimit/components/CheckoutProgress.dart';
import 'package:nolimit/screens/cart/components/checkout_form.dart';
import 'package:nolimit/size_config.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CheckoutProgress(index: 2),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 0),
            child: Container(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Methods",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.black),
                  ),
                  Text(
                    "Please Select a delivery Method",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kPrimaryColor.withOpacity(0.6)),
                    ),
                    child: Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: "true",
                            groupValue: "test",
                            onChanged: (String? value) {
                              setState(() {
                                // _character = value;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Standard Delivery",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Rs.200.00",
                                  style: TextStyle(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Estimated Delivery: 3-5 days",
                                  style: TextStyle(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      // color: kPrimaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kBorderColor),
                    ),
                    child: Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: "true",
                            groupValue: "test",
                            onChanged: (String? value) {
                              setState(() {
                                // _character = value;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Express Delivery",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Rs.500.00",
                                  style: TextStyle(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Estimated Delivery: 1 day",
                                  style: TextStyle(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
