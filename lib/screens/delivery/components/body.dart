import 'package:flutter/material.dart';
import 'package:nolimit/components/CheckoutProgress.dart';
import 'package:nolimit/components/secondary_button.dart';
import 'package:nolimit/models/Order.dart';
import 'package:nolimit/screens/cart/components/checkout_form.dart';
import 'package:nolimit/screens/payment/payment_screen.dart';
import 'package:nolimit/size_config.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String deliveryType = "";
  double deliveryCharge = 0.0;

  setDelivery(String type, double charge) {
    setState(() {
      deliveryType = type;
      deliveryCharge = charge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Column(
            children: [
              CheckoutProgress(index: 2),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 0),
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
                    DeliveryContainer(
                      name: "Standard Delivery",
                      amount: 200.00,
                      estimatedDelivery: "3-5 days",
                      deliveryType: deliveryType,
                      setDelivery: setDelivery,
                    ),
                    DeliveryContainer(
                      name: "Express Delivery",
                      amount: 500.00,
                      estimatedDelivery: "1 day",
                      deliveryType: deliveryType,
                      setDelivery: setDelivery,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SecondaryButton(
              text: "Continue to Payment",
              press: () {
                Order order = Order.getOrder();
                order.deliveryType = deliveryType;
                order.deliveryCharge = deliveryCharge;
                print(deliveryCharge);
                Order.setOrder(order);
                Navigator.pushNamed(context, PaymentScreen.routeName);
              },
            ),
          )
        ],
      ),
    );
  }
}

class DeliveryContainer extends StatefulWidget {
  DeliveryContainer(
      {Key? key,
      required this.name,
      required this.amount,
      required this.estimatedDelivery,
      required this.deliveryType,
      required this.setDelivery})
      : super(key: key);
  final String name;
  final double amount;
  final String estimatedDelivery;
  String deliveryType;
  Function setDelivery;

  @override
  State<DeliveryContainer> createState() => _DeliveryContainerState();
}

class _DeliveryContainerState extends State<DeliveryContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.deliveryType = widget.name;
        widget.setDelivery(widget.name, widget.amount);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: widget.name == widget.deliveryType
              ? kPrimaryColor.withOpacity(0.05)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.name == widget.deliveryType
                ? kPrimaryColor.withOpacity(0.6)
                : kGreyBorder,
          ),
        ),
        child: Expanded(
          child: Row(
            children: [
              Radio(
                value: widget.name,
                groupValue: widget.deliveryType,
                onChanged: (String? value) {
                  setState(() {
                    widget.deliveryType = value!;
                    widget.setDelivery(value, widget.amount);
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rs.${widget.amount}",
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Estimated Delivery: ${widget.estimatedDelivery}",
                      style: TextStyle(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
