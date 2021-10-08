import 'package:flutter/material.dart';

import '../constants.dart';

class CheckoutProgress extends StatelessWidget {
  const CheckoutProgress({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: [1, 2, 3].contains(index)
                        ? kPrimaryColor
                        : kGreyBorder),
              ),
              Container(
                height: 2,
                width: 100,
                color: [2, 3].contains(index) ? kPrimaryColor : kGreyBorder,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        [2, 3].contains(index) ? kPrimaryColor : kGreyBorder),
              ),
              Container(
                height: 2,
                width: 100,
                color: [3].contains(index) ? kPrimaryColor : kGreyBorder,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 3 ? kPrimaryColor : kGreyBorder),
              ),
            ],
          ),
        ),
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping",
                style: TextStyle(
                    color: index == 1 ? kPrimaryColor : Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              Text("Delivery",
                  style: TextStyle(
                      color: index == 2 ? kPrimaryColor : Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
              Text("Payment",
                  style: TextStyle(
                      color: index == 3 ? kPrimaryColor : Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
            ],
          ),
        ),
      ],
    );
  }
}
