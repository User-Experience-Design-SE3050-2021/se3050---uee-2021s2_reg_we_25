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
    return OfferImages(offer: offer);
  }
}

class OfferImages extends StatelessWidget {
  const OfferImages({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(250),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              offer.images[0],
              height: 200,
              width: 300,
            ),
          ),
        ),
        OfferDescription(
          offer: offer,
        ),

      ],
    );
  }
}


