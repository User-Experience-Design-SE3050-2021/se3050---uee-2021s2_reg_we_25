import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nolimit/constants.dart';
import 'package:nolimit/models/Offer.dart';
import 'package:nolimit/size_config.dart';
import 'package:nolimit/screens/singleOffer/components/offer_description.dart';

class Body extends StatelessWidget {
  final Offer offer;

  Body({required this.offer});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // width: double.infinity,
            child: Image.network(offer.heroImage),
          ),
          TopRoundedContainer(
              color: Colors.white,
              child: Column(children: [
                Text(
                  offer.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                ...List.generate(offer.conditions.length, (index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 25, right: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${offer.conditions[index]}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  );
                })
              ]))
        ],
      ),
    ));
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 390),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: child,
    );
  }
}
